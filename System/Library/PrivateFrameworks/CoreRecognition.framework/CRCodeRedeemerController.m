@implementation CRCodeRedeemerController

+ (unint64_t)isCRCodeRedeemerAvailable
{
  return +[CRCameraReader supportedCameraCount](CRCameraReader, "supportedCameraCount");
}

- (CRCodeRedeemerController)init
{
  CRCodeRedeemerController *v2;
  CRCodeRedeemerController *v3;
  void *v4;
  objc_super v6;
  objc_super v7;
  objc_super v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x24BDAC8D0];
  v8.receiver = self;
  v8.super_class = (Class)CRCodeRedeemerController;
  v2 = -[CRCameraReader init](&v8, sel_init);
  v3 = v2;
  if (v2)
  {
    v7.receiver = v2;
    v7.super_class = (Class)CRCodeRedeemerController;
    -[CRCameraReader setDelegate:](&v7, sel_setDelegate_, v2);
    v9[0] = CFSTR("CROutputTypeiTunesCode");
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v9, 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v6.receiver = v3;
    v6.super_class = (Class)CRCodeRedeemerController;
    -[CRCameraReader setOutputObjectTypes:](&v6, sel_setOutputObjectTypes_, v4);

    -[CRCodeRedeemerController setDelegateQueue:](v3, "setDelegateQueue:", MEMORY[0x24BDAC9B8]);
  }
  return v3;
}

+ (id)findCodeInImage:(vImage_Buffer *)a3 maxStage:(unint64_t)a4
{
  double width;
  double height;
  __int128 v6;
  _OWORD v8[2];

  width = (double)a3->width;
  height = (double)a3->height;
  v6 = *(_OWORD *)&a3->width;
  v8[0] = *(_OWORD *)&a3->data;
  v8[1] = v6;
  +[CRCodeRedeemerController findCodeInImage:maxStage:roi:](CRCodeRedeemerController, "findCodeInImage:maxStage:roi:", v8, a4, 0.0, 0.0, width, height);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)findCodeInImage:(vImage_Buffer *)a3 maxStage:(unint64_t)a4 roi:(CGRect)a5
{
  __int128 v5;
  _OWORD v7[2];

  v5 = *(_OWORD *)&a3->width;
  v7[0] = *(_OWORD *)&a3->data;
  v7[1] = v5;
  +[CRCameraReader findCodeInImage:maxStage:roi:](CRCameraReader, "findCodeInImage:maxStage:roi:", v7, a4, a5.origin.x, a5.origin.y, a5.size.width, a5.size.height);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)showMessage:(id)a3 color:(id)a4 style:(unint64_t)a5 duration:(double)a6
{
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CRCodeRedeemerController;
  -[CRCameraReader showMessage:color:style:duration:](&v6, sel_showMessage_color_style_duration_, a3, a4, a5, a6);
}

- (void)cameraReader:(id)a3 didFailWithError:(id)a4
{
  void *v5;
  id v6;

  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObject:forKey:", a4, CFSTR("Error"));
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[CRCodeRedeemerController delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "codeRedeemerController:didEndWithInfo:", self, v6);

}

- (void)cameraReader:(id)a3 didRecognizeObjects:(id)a4
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v4 = a4;
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v17 != v8)
          objc_enumerationMutation(v6);
        v10 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        objc_msgSend(v10, "type");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "isEqualToString:", CFSTR("CROutputTypeiTunesCode"));

        if (v12)
        {
          objc_msgSend(v10, "stringValue");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "setObject:forKey:", v13, CFSTR("Code"));

        }
      }
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v7);
  }

  -[CRCodeRedeemerController delegate](self, "delegate");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "codeRedeemerController:didEndWithInfo:", self, v5);

}

- (void)cameraReaderDidCancel:(id)a3
{
  id v4;

  -[CRCodeRedeemerController delegate](self, "delegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "codeRedeemerControllerDidCancel:", self);

}

- (void)cameraReaderDidDisplayMessage:(id)a3
{
  char v4;
  id v5;
  id v6;

  -[CRCodeRedeemerController delegate](self, "delegate", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    -[CRCodeRedeemerController delegate](self, "delegate");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "codeRedeemerControllerDidDisplayMessage:", self);

  }
}

- (void)cameraReaderDidFindTarget:(id)a3
{
  char v4;
  id v5;
  id v6;

  -[CRCodeRedeemerController delegate](self, "delegate", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    -[CRCodeRedeemerController delegate](self, "delegate");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "codeRedeemerControllerDidFindBox:", self);

  }
}

- (CRCodeRedeemerControllerDelegate)delegate
{
  return (CRCodeRedeemerControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (OS_dispatch_queue)delegateQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 1504, 1);
}

- (void)setDelegateQueue:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1504);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_delegateQueue, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
