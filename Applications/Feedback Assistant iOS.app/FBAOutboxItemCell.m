@implementation FBAOutboxItemCell

- (void)awakeFromNib
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)FBAOutboxItemCell;
  -[FBAInboxItemCell awakeFromNib](&v7, "awakeFromNib");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[FBAOutboxItemCell indeterminateSpinner](self, "indeterminateSpinner"));
  objc_msgSend(v3, "setActivityIndicatorViewStyle:", 100);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[FBAOutboxItemCell indeterminateSpinner](self, "indeterminateSpinner"));
  objc_msgSend(v4, "stopAnimating");

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[FBANetworkMonitor sharedInstance](FBANetworkMonitor, "sharedInstance"));
  -[FBAOutboxItemCell setNetMonitor:](self, "setNetMonitor:", v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[FBAOutboxItemCell netMonitor](self, "netMonitor"));
  objc_msgSend(v6, "addObserver:forKeyPath:options:context:", self, CFSTR("isConnectedToCellNetwork"), 1, off_100115A20);

}

- (void)setObservedResponse:(id)a3
{
  FBKFormResponse **p_observedResponse;
  void *v6;
  void *v7;
  unsigned __int8 v8;
  void *v9;
  id v10;

  v10 = a3;
  p_observedResponse = &self->_observedResponse;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[FBKFormResponse ID](self->_observedResponse, "ID"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "ID"));
  v8 = objc_msgSend(v6, "isEqual:", v7);

  if ((v8 & 1) == 0)
  {
    if (*p_observedResponse)
      -[FBAOutboxItemCell stopObservingResponse:](self, "stopObservingResponse:");
    objc_storeStrong((id *)&self->_observedResponse, a3);
    -[FBAOutboxItemCell beginObservingResponse:](self, "beginObservingResponse:", *p_observedResponse);
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "uploadTask"));
  -[FBAOutboxItemCell updateUploadStage:](self, "updateUploadStage:", objc_msgSend(v9, "localSubmissionStage"));

  -[FBAOutboxItemCell updateProgressWithFormResponse:](self, "updateProgressWithFormResponse:", v10);
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  if (self->_observedResponse)
    -[FBAOutboxItemCell stopObservingResponse:](self, "stopObservingResponse:");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[FBAOutboxItemCell netMonitor](self, "netMonitor"));
  objc_msgSend(v3, "removeObserver:forKeyPath:", self, CFSTR("isConnectedToCellNetwork"));

  v4.receiver = self;
  v4.super_class = (Class)FBAOutboxItemCell;
  -[FBAOutboxItemCell dealloc](&v4, "dealloc");
}

- (void)beginObservingResponse:(id)a3
{
  void *v4;
  id v5;

  v4 = off_100115A28;
  v5 = a3;
  objc_msgSend(v5, "addObserver:forKeyPath:options:context:", self, CFSTR("uploadTask.bytesToUpload"), 1, v4);
  objc_msgSend(v5, "addObserver:forKeyPath:options:context:", self, CFSTR("uploadTask.localSubmissionStage"), 1, off_100115A30);

}

- (void)stopObservingResponse:(id)a3
{
  void *v4;
  id v5;

  v4 = off_100115A28;
  v5 = a3;
  objc_msgSend(v5, "removeObserver:forKeyPath:context:", self, CFSTR("uploadTask.bytesToUpload"), v4);
  objc_msgSend(v5, "removeObserver:forKeyPath:context:", self, CFSTR("uploadTask.localSubmissionStage"), off_100115A30);

}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  objc_super v16;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  if (off_100115A28 == a6)
  {
    -[FBAOutboxItemCell updateProgressWithFormResponse:](self, "updateProgressWithFormResponse:", self->_observedResponse);
  }
  else if (off_100115A30 == a6)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[FBKFormResponse uploadTask](self->_observedResponse, "uploadTask"));
    -[FBAOutboxItemCell updateUploadStage:](self, "updateUploadStage:", objc_msgSend(v13, "localSubmissionStage"));

  }
  else if (off_100115A20 == a6)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[FBAOutboxItemCell netMonitor](self, "netMonitor"));
    v15 = objc_msgSend(v14, "shouldShowWaitingOnWifi");

    -[FBAOutboxItemCell updateForNetworkStateChange:](self, "updateForNetworkStateChange:", v15);
  }
  else
  {
    v16.receiver = self;
    v16.super_class = (Class)FBAOutboxItemCell;
    -[FBAOutboxItemCell observeValueForKeyPath:ofObject:change:context:](&v16, "observeValueForKeyPath:ofObject:change:context:", v10, v11, v12, a6);
  }

}

- (void)updateForNetworkStateChange:(BOOL)a3
{
  _BOOL4 v3;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v3 = a3;
  if ((id)-[FBAOutboxItemCell lastStage](self, "lastStage") == (id)4)
  {
    v9 = (id)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    if (v3)
    {
      v5 = LocalizableGTStringKeyForKey(CFSTR("OUTBOX_WAITING_ON_WIFI"));
      v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "localizedStringForKey:value:table:", v6, &stru_1000EA660, 0));
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[FBAInboxItemCell subtitleLabel](self, "subtitleLabel"));
      objc_msgSend(v8, "setText:", v7);

    }
    else
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("OUTBOX_UPLOADING"), &stru_1000EA660, 0));
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[FBAInboxItemCell subtitleLabel](self, "subtitleLabel"));
      objc_msgSend(v7, "setText:", v6);
    }

  }
}

- (void)updateProgressWithFormResponse:(id)a3
{
  void *v4;
  float v5;
  void *v6;
  float v7;
  float v8;
  void *v9;
  float v10;
  float v11;
  void *v12;
  float v13;
  void *v14;
  double v15;
  void *v16;
  id v17;

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "uploadTask"));
  v5 = 0.0;
  v17 = v4;
  if (v4)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "bytesToUpload"));
    objc_msgSend(v6, "floatValue");
    v8 = v7;

    if (v8 != 0.0)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "bytesUploaded"));
      objc_msgSend(v9, "floatValue");
      v11 = v10;
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "bytesToUpload"));
      objc_msgSend(v12, "floatValue");
      v5 = v11 / v13;

    }
  }
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[FBAOutboxItemCell progressView](self, "progressView"));
  *(float *)&v15 = v5;
  objc_msgSend(v14, "setProgress:", v15);

  v16 = (void *)objc_claimAutoreleasedReturnValue(-[FBAOutboxItemCell netMonitor](self, "netMonitor"));
  -[FBAOutboxItemCell updateForNetworkStateChange:](self, "updateForNetworkStateChange:", objc_msgSend(v16, "shouldShowWaitingOnWifi"));

}

- (void)updateUploadStage:(unint64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  const __CFString *v8;
  void *v9;
  unsigned int v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  const __CFString *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;

  -[FBAOutboxItemCell setLastStage:](self, "setLastStage:");
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor labelColor](UIColor, "labelColor"));
  switch(a3)
  {
    case 0uLL:
    case 1uLL:
      v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v7 = v6;
      v8 = CFSTR("OUTBOX_READY_TO_UPLOAD");
      goto LABEL_10;
    case 2uLL:
      v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v26 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "localizedStringForKey:value:table:", CFSTR("OUTBOX_COLLECTING"), &stru_1000EA660, 0));

      goto LABEL_18;
    case 3uLL:
      v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v18 = v17;
      v19 = CFSTR("OUTBOX_SUBMISSION_TOO_LARGE");
      goto LABEL_12;
    case 4uLL:
    case 8uLL:
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[FBAOutboxItemCell netMonitor](self, "netMonitor"));
      v10 = objc_msgSend(v9, "shouldShowWaitingOnWifi");

      v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v12 = v11;
      if (v10)
      {
        v13 = LocalizableGTStringKeyForKey(CFSTR("OUTBOX_WAITING_ON_WIFI"));
        v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
        v26 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "localizedStringForKey:value:table:", v14, &stru_1000EA660, 0));

      }
      else
      {
        v26 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("OUTBOX_UPLOADING"), &stru_1000EA660, 0));
      }

      if (a3 == 8)
      {
LABEL_18:
        v22 = (void *)objc_claimAutoreleasedReturnValue(-[FBAOutboxItemCell indeterminateSpinner](self, "indeterminateSpinner"));
        objc_msgSend(v22, "startAnimating");
        v15 = 1;
      }
      else
      {
        v15 = 0;
LABEL_15:
        v22 = (void *)objc_claimAutoreleasedReturnValue(-[FBAOutboxItemCell indeterminateSpinner](self, "indeterminateSpinner"));
        objc_msgSend(v22, "stopAnimating");
      }

      v23 = (void *)objc_claimAutoreleasedReturnValue(-[FBAInboxItemCell subtitleLabel](self, "subtitleLabel"));
      objc_msgSend(v23, "setText:", v26);

      v24 = (void *)objc_claimAutoreleasedReturnValue(-[FBAInboxItemCell subtitleLabel](self, "subtitleLabel"));
      objc_msgSend(v24, "setTextColor:", v5);

      v25 = (void *)objc_claimAutoreleasedReturnValue(-[FBAOutboxItemCell progressView](self, "progressView"));
      objc_msgSend(v25, "setHidden:", v15);

      return;
    case 5uLL:
      v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v26 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "localizedStringForKey:value:table:", CFSTR("OUTBOX_FAILED"), &stru_1000EA660, 0));

      v21 = objc_claimAutoreleasedReturnValue(+[UIColor redColor](UIColor, "redColor"));
      v15 = 0;
      v7 = v5;
      goto LABEL_13;
    case 6uLL:
      v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v7 = v6;
      v8 = CFSTR("OUTBOX_READY_FOR_COMPLETE");
LABEL_10:
      v26 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "localizedStringForKey:value:table:", v8, &stru_1000EA660, 0));
      v15 = 1;
      goto LABEL_14;
    case 7uLL:
      v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v18 = v17;
      v19 = CFSTR("OUTBOX_SUBMISSION_FAILED");
LABEL_12:
      v26 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "localizedStringForKey:value:table:", v19, &stru_1000EA660, 0));

      v21 = objc_claimAutoreleasedReturnValue(+[UIColor redColor](UIColor, "redColor"));
      v7 = v5;
      v15 = 1;
LABEL_13:
      v5 = (void *)v21;
LABEL_14:

      goto LABEL_15;
    default:
      v15 = 0;
      v26 = 0;
      goto LABEL_15;
  }
}

- (FBARadialProgressView)progressView
{
  return (FBARadialProgressView *)objc_loadWeakRetained((id *)&self->_progressView);
}

- (void)setProgressView:(id)a3
{
  objc_storeWeak((id *)&self->_progressView, a3);
}

- (FBKFormResponse)observedResponse
{
  return self->_observedResponse;
}

- (UIActivityIndicatorView)indeterminateSpinner
{
  return (UIActivityIndicatorView *)objc_loadWeakRetained((id *)&self->_indeterminateSpinner);
}

- (void)setIndeterminateSpinner:(id)a3
{
  objc_storeWeak((id *)&self->_indeterminateSpinner, a3);
}

- (FBANetworkMonitor)netMonitor
{
  return (FBANetworkMonitor *)objc_loadWeakRetained((id *)&self->_netMonitor);
}

- (void)setNetMonitor:(id)a3
{
  objc_storeWeak((id *)&self->_netMonitor, a3);
}

- (unint64_t)lastStage
{
  return self->_lastStage;
}

- (void)setLastStage:(unint64_t)a3
{
  self->_lastStage = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_netMonitor);
  objc_destroyWeak((id *)&self->_indeterminateSpinner);
  objc_storeStrong((id *)&self->_observedResponse, 0);
  objc_destroyWeak((id *)&self->_progressView);
}

@end
