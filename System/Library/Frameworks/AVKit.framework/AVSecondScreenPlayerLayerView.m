@implementation AVSecondScreenPlayerLayerView

- (void)dealloc
{
  objc_super v3;

  -[AVSecondScreenPlayerLayerView stopShowingContentFromActiveSourcePlayerLayer](self, "stopShowingContentFromActiveSourcePlayerLayer");
  v3.receiver = self;
  v3.super_class = (Class)AVSecondScreenPlayerLayerView;
  -[AVSecondScreenPlayerLayerView dealloc](&v3, sel_dealloc);
}

- (void)startShowingContentFromSourcePlayerLayer:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  void *v7;
  AVObservationController *v8;
  void *v9;
  id v10;
  id v11;

  v11 = a3;
  -[AVSecondScreenPlayerLayerView activeSourcePlayerLayer](self, "activeSourcePlayerLayer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqual:", v11);

  if ((v5 & 1) == 0)
  {
    -[AVSecondScreenPlayerLayerView stopShowingContentFromActiveSourcePlayerLayer](self, "stopShowingContentFromActiveSourcePlayerLayer");
    -[AVSecondScreenPlayerLayerView setActiveSourcePlayerLayer:](self, "setActiveSourcePlayerLayer:", v11);
    -[AVSecondScreenPlayerLayerView layer](self, "layer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "startRedirectingVideoToLayer:forMode:", v6, 1);

    -[AVSecondScreenPlayerLayerView observationController](self, "observationController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v7)
    {
      v8 = -[AVObservationController initWithOwner:]([AVObservationController alloc], "initWithOwner:", self);
      -[AVSecondScreenPlayerLayerView setObservationController:](self, "setObservationController:", v8);

      -[AVSecondScreenPlayerLayerView observationController](self, "observationController");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = (id)objc_msgSend(v9, "startObserving:keyPath:includeInitialValue:observationHandler:", self, CFSTR("layer.videoRect"), 1, &__block_literal_global_20361);

    }
  }

}

- (void)stopShowingContentFromActiveSourcePlayerLayer
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  -[AVSecondScreenPlayerLayerView observationController](self, "observationController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stopAllObservation");

  -[AVSecondScreenPlayerLayerView setObservationController:](self, "setObservationController:", 0);
  -[AVSecondScreenPlayerLayerView activeSourcePlayerLayer](self, "activeSourcePlayerLayer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVSecondScreenPlayerLayerView layer](self, "layer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stopRedirectingVideoToLayer:", v5);

  -[AVSecondScreenPlayerLayerView setActiveSourcePlayerLayer:](self, "setActiveSourcePlayerLayer:", 0);
  -[AVSecondScreenPlayerLayerView layer](self, "layer");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setPlayer:", 0);

}

- (AVPlayerLayer)activeSourcePlayerLayer
{
  return (AVPlayerLayer *)objc_loadWeakRetained((id *)&self->_activeSourcePlayerLayer);
}

- (void)setActiveSourcePlayerLayer:(id)a3
{
  objc_storeWeak((id *)&self->_activeSourcePlayerLayer, a3);
}

- (AVObservationController)observationController
{
  return self->_observationController;
}

- (void)setObservationController:(id)a3
{
  objc_storeStrong((id *)&self->_observationController, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observationController, 0);
  objc_destroyWeak((id *)&self->_activeSourcePlayerLayer);
}

void __74__AVSecondScreenPlayerLayerView_startShowingContentFromSourcePlayerLayer___block_invoke()
{
  id v0;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "postNotificationName:object:", CFSTR("AVSecondScreenConnectionVideoDisplaySizeChanged"), 0);

}

+ (Class)layerClass
{
  return (Class)objc_opt_class();
}

@end
