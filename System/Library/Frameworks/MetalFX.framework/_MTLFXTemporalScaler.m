@implementation _MTLFXTemporalScaler

- (void)_emitTelemetry:(id)a3 forDevice:(id)a4
{
  id v5;
  objc_class *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  id v11;

  v5 = a3;
  v9 = a4;
  objc_msgSend(v5, "colorTextureFormat");
  objc_msgSend(v5, "outputTextureFormat");
  objc_msgSend(v5, "inputWidth");
  objc_msgSend(v5, "inputHeight");
  objc_msgSend(v5, "outputWidth");
  objc_msgSend(v5, "outputHeight");
  objc_msgSend(v9, "name");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (objc_class *)objc_opt_class();
  NSStringFromClass(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "version");
  v10 = v7;
  v11 = v8;
  AnalyticsSendEventLazy();

}

@end
