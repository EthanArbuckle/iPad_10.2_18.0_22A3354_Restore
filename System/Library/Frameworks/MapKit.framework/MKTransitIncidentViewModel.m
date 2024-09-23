@implementation MKTransitIncidentViewModel

- (UIColor)backgroundColor
{
  void *v2;
  void *v3;
  double v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  _QWORD v10[4];
  id v11;

  if (-[MKTransitIncidentViewModel isBlocking](self, "isBlocking"))
  {
    objc_msgSend(MEMORY[0x1E0CEA478], "systemRedColor");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = v2;
    v4 = 0.150000006;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA478], "systemYellowColor");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = v2;
    v4 = 0.200000003;
  }
  objc_msgSend(v2, "colorWithAlphaComponent:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_alloc(MEMORY[0x1E0CEA478]);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __45__MKTransitIncidentViewModel_backgroundColor__block_invoke;
  v10[3] = &unk_1E20DBBF0;
  v11 = v5;
  v7 = v5;
  v8 = (void *)objc_msgSend(v6, "initWithDynamicProvider:", v10);

  return (UIColor *)v8;
}

id __45__MKTransitIncidentViewModel_backgroundColor__block_invoke(uint64_t a1, void *a2)
{
  id v3;

  if (objc_msgSend(a2, "userInterfaceStyle") == 2)
  {
    objc_msgSend(MEMORY[0x1E0CEA478], "secondarySystemGroupedBackgroundColor");
    v3 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = *(id *)(a1 + 32);
  }
  return v3;
}

- (NSString)symbolName
{
  if (!-[MKTransitIncidentViewModel showImage](self, "showImage"))
    return 0;
  if (MapKitIdiomIsMacCatalyst())
    return (NSString *)CFSTR("info.circle.fill");
  if (-[MKTransitIncidentViewModel isBlocking](self, "isBlocking"))
    return (NSString *)CFSTR("minus.circle.fill");
  return (NSString *)CFSTR("exclamationmark.circle.fill");
}

- (UIColor)symbolColor
{
  if (-[MKTransitIncidentViewModel isBlocking](self, "isBlocking"))
    objc_msgSend(MEMORY[0x1E0CEA478], "systemRedColor");
  else
    objc_msgSend(MEMORY[0x1E0CEA478], "systemYellowColor");
  return (UIColor *)(id)objc_claimAutoreleasedReturnValue();
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  unint64_t v8;
  unint64_t v9;
  int v10;
  void *v11;
  void *v12;
  unint64_t v13;
  unint64_t v14;
  int v15;
  int v16;
  int v17;
  _BOOL4 v18;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    -[MKTransitIncidentViewModel symbolName](self, "symbolName");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "symbolName");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v6;
    v9 = v7;
    if (v8 | v9 && (v10 = objc_msgSend((id)v8, "isEqual:", v9), (id)v9, (id)v8, !v10))
    {
      LOBYTE(v17) = 0;
    }
    else
    {
      -[MKTransitIncidentViewModel message](self, "message");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "message");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = v11;
      v14 = v12;
      if ((!(v13 | v14)
         || (v15 = objc_msgSend((id)v13, "isEqual:", v14), (id)v14, (id)v13, v15))
        && (v16 = -[MKTransitIncidentViewModel isBlocking](self, "isBlocking"),
            v16 == objc_msgSend(v5, "isBlocking")))
      {
        v18 = -[MKTransitIncidentViewModel showImage](self, "showImage");
        v17 = v18 ^ objc_msgSend(v5, "showImage") ^ 1;
      }
      else
      {
        LOBYTE(v17) = 0;
      }

    }
  }
  else
  {
    LOBYTE(v17) = 0;
  }

  return v17;
}

- (NSString)message
{
  return self->_message;
}

- (void)setMessage:(id)a3
{
  objc_storeStrong((id *)&self->_message, a3);
}

- (BOOL)isBlocking
{
  return self->_blocking;
}

- (void)setBlocking:(BOOL)a3
{
  self->_blocking = a3;
}

- (BOOL)showImage
{
  return self->_showImage;
}

- (void)setShowImage:(BOOL)a3
{
  self->_showImage = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_message, 0);
}

@end
