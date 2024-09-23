@implementation GEOTooltip

- (GEOTooltip)initWithPDTooltip:(id)a3
{
  id *v4;
  GEOTooltip *v5;
  void *v6;
  uint64_t v7;
  NSString *title;
  void *v9;
  uint64_t v10;
  NSString *subtitle;
  void *v12;
  uint64_t v13;
  NSString *actionLink;
  _GEOPlaceDataPhoto *v15;
  void *v16;
  uint64_t v17;
  GEOMapItemPhoto *photo;
  unsigned int v19;
  GEOTooltip *v20;
  objc_super v22;
  uint8_t buf[4];
  unsigned int v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = (id *)a3;
  if (v4)
  {
    v22.receiver = self;
    v22.super_class = (Class)GEOTooltip;
    v5 = -[GEOTooltip init](&v22, sel_init);
    if (v5)
    {
      -[GEOPDTooltip title](v4);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "stringValue");
      v7 = objc_claimAutoreleasedReturnValue();
      title = v5->_title;
      v5->_title = (NSString *)v7;

      -[GEOPDTooltip subtitle](v4);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "stringValue");
      v10 = objc_claimAutoreleasedReturnValue();
      subtitle = v5->_subtitle;
      v5->_subtitle = (NSString *)v10;

      -[GEOPDTooltip actionLink](v4);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "stringValue");
      v13 = objc_claimAutoreleasedReturnValue();
      actionLink = v5->_actionLink;
      v5->_actionLink = (NSString *)v13;

      v15 = [_GEOPlaceDataPhoto alloc];
      -[GEOPDTooltip photo](v4);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = -[_GEOPlaceDataPhoto initWithPhoto:](v15, "initWithPhoto:", v16);
      photo = v5->_photo;
      v5->_photo = (GEOMapItemPhoto *)v17;

      v19 = -[GEOPDTooltip toolTipType]((uint64_t)v4);
      if (v19 >= 2)
      {
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 67109120;
          v24 = v19;
          _os_log_impl(&dword_1885A9000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Unhandled GEOPDTooltip_TooltipType %d", buf, 8u);
        }
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_fault_impl(&dword_1885A9000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "Assertion failed: NO", buf, 2u);
        }
        v19 = 0;
      }
      v5->_type = v19;
    }
    self = v5;
    v20 = self;
  }
  else
  {
    v20 = 0;
  }

  return v20;
}

- (NSString)title
{
  return self->_title;
}

- (NSString)subtitle
{
  return self->_subtitle;
}

- (NSString)actionLink
{
  return self->_actionLink;
}

- (GEOMapItemPhoto)photo
{
  return self->_photo;
}

- (int)type
{
  return self->_type;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_photo, 0);
  objc_storeStrong((id *)&self->_actionLink, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

@end
