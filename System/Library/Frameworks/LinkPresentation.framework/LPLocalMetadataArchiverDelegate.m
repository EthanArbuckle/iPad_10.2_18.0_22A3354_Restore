@implementation LPLocalMetadataArchiverDelegate

- (id)archiver:(id)a3 willEncodeObject:(id)a4
{
  id v5;
  id v6;
  id v7;
  double v8;
  double v9;
  id v10;
  NSObject *v11;
  NSObject *v12;
  uint8_t v14[16];
  uint8_t buf[16];

  v5 = a3;
  v6 = a4;
  if ((objc_msgSend(v5, "_lp_coderOptions") & 1) != 0
    && (objc_opt_respondsToSelector() & 1) != 0
    && (objc_msgSend(v6, "_canEncodeWithoutComputation") & 1) == 0)
  {
    v12 = LPLogChannelSerialization();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A0C41000, v12, OS_LOG_TYPE_DEFAULT, "Low fidelity encoder: dropping image, can't encode without computation", buf, 2u);
    }
    v10 = 0;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
LABEL_8:
      v10 = v6;
      goto LABEL_18;
    }
    v7 = v6;
    if ((unint64_t)objc_msgSend(v7, "_encodedSize") <= 0x100000)
    {
      objc_msgSend(v7, "_pixelSize");
      if (sizeFitsWithinSize(v8, v9, 1600.0, 1600.0))
      {

        goto LABEL_8;
      }
    }
    if ((objc_msgSend(v5, "_lp_coderOptions") & 1) != 0)
    {
      v11 = LPLogChannelSerialization();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v14 = 0;
        _os_log_impl(&dword_1A0C41000, v11, OS_LOG_TYPE_DEFAULT, "Low fidelity encoder: dropping image, requires resampling", v14, 2u);
      }
      v10 = 0;
    }
    else
    {
      fitImageInSizeSync(v7, 1024.0, 1024.0);
      v10 = (id)objc_claimAutoreleasedReturnValue();
    }

  }
LABEL_18:

  return v10;
}

@end
