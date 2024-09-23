@implementation IFImage(ISImagePriv)

- (NSData)data
{
  NSData *data;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  uint64_t v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  NSObject *v20;
  int v21;
  double v22;
  double v23;
  double v24;
  float v25;
  double v26;
  double v27;
  float v28;
  double v29;
  double v30;
  float v31;
  void *v32;
  NSData *v33;
  NSData *v34;
  id v36;
  _DWORD v37[10];
  uint64_t v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  data = self->_data;
  if (!data)
  {
    -[IFImage size](self, "size");
    v5 = v4;
    v7 = v6;
    -[IFImage scale](self, "scale");
    +[IFGraphicsContext bitmapContextWithSize:scale:preset:](IFGraphicsContext, "bitmapContextWithSize:scale:preset:", 0, v5, v7, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[IFImage CGImage](self, "CGImage");
    -[IFImage size](self, "size");
    v12 = v11;
    -[IFImage size](self, "size");
    objc_msgSend(v9, "drawCGImage:inRect:", v10, 0.0, 0.0, v12, v13);
    objc_msgSend(v9, "data");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v14)
    {
      IFDefaultLog();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        -[IFImage(ISImagePriv) data].cold.2((uint64_t)self, v15);

    }
    -[IFImage CALayer](self, "CALayer");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v16)
    {
      v17 = (void *)MEMORY[0x1E0CB36F8];
      -[IFImage CALayer](self, "CALayer");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = 0;
      objc_msgSend(v17, "archivedDataWithRootObject:requiringSecureCoding:error:", v18, 1, &v36);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = v36;

      if (!v16)
      {
        IFDefaultLog();
        v20 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
          -[IFImage(ISImagePriv) data].cold.1((uint64_t)self, (uint64_t)v19, v20);

      }
      v21 = objc_msgSend(v16, "length");

    }
    else
    {
      v21 = 0;
    }
    v38 = 0;
    v37[0] = 6;
    v37[1] = objc_msgSend(v14, "length");
    v37[2] = v21;
    -[IFImage scale](self, "scale");
    v37[3] = v22;
    -[IFImage size](self, "size");
    *(float *)&v23 = v23;
    v37[8] = LODWORD(v23);
    -[IFImage size](self, "size");
    v25 = v24;
    *(float *)&v37[9] = v25;
    -[IFImage iconSize](self, "iconSize");
    *(float *)&v26 = v26;
    v37[4] = LODWORD(v26);
    -[IFImage iconSize](self, "iconSize");
    v28 = v27;
    *(float *)&v37[5] = v28;
    -[IFImage minimumSize](self, "minimumSize");
    *(float *)&v29 = v29;
    v37[6] = LODWORD(v29);
    -[IFImage minimumSize](self, "minimumSize");
    v31 = v30;
    *(float *)&v37[7] = v31;
    v32 = (void *)objc_opt_new();
    objc_msgSend(v32, "appendBytes:length:", v37, 48);
    objc_msgSend(v32, "appendData:", v14);
    objc_msgSend(v32, "appendData:", v16);
    v33 = (NSData *)objc_msgSend(v32, "copy");
    v34 = self->_data;
    self->_data = v33;

    data = self->_data;
  }
  return data;
}

- (void)data
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_1D4106000, a2, OS_LOG_TYPE_ERROR, "Failed getting bitmap data for %@", (uint8_t *)&v2, 0xCu);
}

@end
