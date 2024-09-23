@implementation CUIKIcon

- (CUIKIcon)initWithDate:(id)a3 calendar:(id)a4 format:(int64_t)a5
{
  id v8;
  void *v9;
  CUIKIcon *v10;

  v8 = a4;
  objc_msgSend(v8, "components:fromDate:", 542, a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[CUIKIcon initWithDateComponents:calendar:format:forceNoTextEffects:](self, "initWithDateComponents:calendar:format:forceNoTextEffects:", v9, v8, a5, 0);

  return v10;
}

- (CUIKIcon)initWithDateComponents:(id)a3 calendar:(id)a4 format:(int64_t)a5 forceNoTextEffects:(BOOL)a6
{
  _BOOL8 v6;
  id v10;
  id v11;
  CUIKIcon *v12;
  uint64_t v13;
  NSDateComponents *dateComponents;
  void *v15;
  int v16;
  void *v17;
  void *v18;
  uint64_t v19;
  NSDateComponents *v20;
  uint64_t v21;
  NSCalendar *calendar;
  CUIKDefaultIconGenerator *v23;
  CUIKIconGenerator *iconGenerator;
  objc_super v26;

  v6 = a6;
  v10 = a3;
  v11 = a4;
  v26.receiver = self;
  v26.super_class = (Class)CUIKIcon;
  v12 = (CUIKIcon *)-[CUIKIcon _init](&v26, sel__init);
  if (v12)
  {
    v13 = objc_msgSend(v10, "copy");
    dateComponents = v12->_dateComponents;
    v12->_dateComponents = (NSDateComponents *)v13;

    objc_msgSend(MEMORY[0x1E0D0C2F8], "shared");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "stopTimeDemoModeActive");

    if (v16)
    {
      objc_msgSend(MEMORY[0x1E0D0C2F8], "shared");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "stopTimeDemoModeComponents");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v18, "copy");
      v20 = v12->_dateComponents;
      v12->_dateComponents = (NSDateComponents *)v19;

    }
    v21 = objc_msgSend(v11, "copy");
    calendar = v12->_calendar;
    v12->_calendar = (NSCalendar *)v21;

    v12->_format = a5;
    v23 = -[CUIKDefaultIconGenerator initWithForceNoTextEffects:]([CUIKDefaultIconGenerator alloc], "initWithForceNoTextEffects:", v6);
    iconGenerator = v12->_iconGenerator;
    v12->_iconGenerator = (CUIKIconGenerator *)v23;

  }
  return v12;
}

- (void)prepareImagesForImageDescriptors:(id)a3
{
  id v4;
  ISIcon *internalIcon;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  uint64_t v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  const void *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  int64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  int64_t v31;
  void *v32;
  ISIcon *v33;
  ISIcon *v34;
  void *v35;
  id obj;
  void *v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  uint8_t buf[4];
  void *v43;
  __int16 v44;
  void *v45;
  __int16 v46;
  int64_t v47;
  __int16 v48;
  double v49;
  __int16 v50;
  double v51;
  __int16 v52;
  double v53;
  __int16 v54;
  void *v55;
  _BYTE v56[128];
  uint64_t v57;

  v57 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  internalIcon = self->_internalIcon;
  self->_internalIcon = 0;

  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v4, "count"));
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  obj = v4;
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v38, v56, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v39;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v39 != v8)
          objc_enumerationMutation(obj);
        v10 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * i);
        objc_msgSend(v10, "size");
        v12 = v11;
        v14 = v13;
        objc_msgSend(v10, "scale");
        v16 = v15;
        v17 = objc_msgSend(v10, "appearance");
        +[CUIKLogSubsystem defaultCategory](CUIKLogSubsystem, "defaultCategory");
        v18 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
        {
          -[CUIKIcon dateComponents](self, "dateComponents");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          -[CUIKIcon calendar](self, "calendar");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v35, "calendarIdentifier");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          v26 = -[CUIKIcon format](self, "format");
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v17);
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138544898;
          v43 = v24;
          v44 = 2114;
          v45 = v25;
          v46 = 2048;
          v47 = v26;
          v48 = 2048;
          v49 = v12;
          v50 = 2048;
          v51 = v14;
          v52 = 2048;
          v53 = v16;
          v54 = 2112;
          v55 = v27;
          _os_log_debug_impl(&dword_1B8A6A000, v18, OS_LOG_TYPE_DEBUG, "Request to prepare icon with dateComponents: %{public}@, calendar: %{public}@, format: %ld, size: (%f, %f), scale: %f, appearance: %@", buf, 0x48u);

        }
        -[CUIKIcon iconGenerator](self, "iconGenerator");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        -[CUIKIcon dateComponents](self, "dateComponents");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        -[CUIKIcon calendar](self, "calendar");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = (const void *)objc_msgSend(v19, "iconImageWithDateComponents:calendar:format:size:scale:appearance:", v20, v21, -[CUIKIcon format](self, "format"), v17, v12, v14, v16);

        if (v22)
        {
          v23 = objc_msgSend(objc_alloc(MEMORY[0x1E0D3A7C0]), "initWithCGImage:scale:", v22, v16);
          CFRelease(v22);
          objc_msgSend(v37, "addObject:", v23);
        }
        else
        {
          +[CUIKLogSubsystem defaultCategory](CUIKLogSubsystem, "defaultCategory");
          v23 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
          {
            -[CUIKIcon dateComponents](self, "dateComponents");
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            -[CUIKIcon calendar](self, "calendar");
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v29, "calendarIdentifier");
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            v31 = -[CUIKIcon format](self, "format");
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v17);
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138544898;
            v43 = v28;
            v44 = 2114;
            v45 = v30;
            v46 = 2048;
            v47 = v31;
            v48 = 2048;
            v49 = v12;
            v50 = 2048;
            v51 = v14;
            v52 = 2048;
            v53 = v16;
            v54 = 2112;
            v55 = v32;
            _os_log_error_impl(&dword_1B8A6A000, v23, OS_LOG_TYPE_ERROR, "Failed to prepare icon with dateComponents: %{public}@, calendar: %{public}@, format: %ld, size: (%f, %f), scale: %f, appearance: %@", buf, 0x48u);

          }
        }

      }
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v38, v56, 16);
    }
    while (v7);
  }

  if (objc_msgSend(v37, "count"))
  {
    v33 = (ISIcon *)objc_msgSend(objc_alloc(MEMORY[0x1E0D3A820]), "initWithImages:", v37);
    v34 = self->_internalIcon;
    self->_internalIcon = v33;

  }
}

- (id)prepareImageForDescriptor:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[CUIKIcon imageForDescriptor:](self, "imageForDescriptor:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (!v5 || objc_msgSend(v5, "placeholder"))
  {
    v10[0] = v4;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[CUIKIcon prepareImagesForImageDescriptors:](self, "prepareImagesForImageDescriptors:", v7);

    -[CUIKIcon imageForDescriptor:](self, "imageForDescriptor:", v4);
    v8 = objc_claimAutoreleasedReturnValue();

    v6 = (void *)v8;
  }

  return v6;
}

- (id)imageForDescriptor:(id)a3
{
  return (id)-[ISIcon imageForDescriptor:](self->_internalIcon, "imageForDescriptor:", a3);
}

- (void)getImageForImageDescriptor:(id)a3 completion:(id)a4
{
  id v7;
  id v8;

  v7 = a4;
  -[CUIKIcon prepareImageForDescriptor:](self, "prepareImageForDescriptor:", a3);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, id))a4 + 2))(v7, v8);

}

- (NSDateComponents)dateComponents
{
  return self->_dateComponents;
}

- (NSCalendar)calendar
{
  return self->_calendar;
}

- (int64_t)format
{
  return self->_format;
}

- (CUIKIconGenerator)iconGenerator
{
  return self->_iconGenerator;
}

- (ISIcon)internalIcon
{
  return self->_internalIcon;
}

- (void)setInternalIcon:(id)a3
{
  objc_storeStrong((id *)&self->_internalIcon, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_internalIcon, 0);
  objc_storeStrong((id *)&self->_iconGenerator, 0);
  objc_storeStrong((id *)&self->_calendar, 0);
  objc_storeStrong((id *)&self->_dateComponents, 0);
}

@end
