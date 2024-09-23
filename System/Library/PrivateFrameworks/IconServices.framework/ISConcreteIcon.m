@implementation ISConcreteIcon

- (id)imageForDescriptor:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  NSObject *v7;
  _BOOL4 v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  NSObject *v13;
  _BOOL4 v14;
  void *v15;
  void *v16;
  NSObject *v17;
  NSObject *v18;
  _BOOL4 v19;
  void *v20;
  void *v21;
  void *v22;
  uint8_t buf[4];
  ISConcreteIcon *v25;
  __int16 v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)objc_msgSend(v4, "copy");
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    if (objc_msgSend(v5, "ignoreCache"))
    {
      _ISDefaultLog();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412546;
        v25 = self;
        v26 = 2112;
        v27 = v5;
        _os_log_impl(&dword_1AA928000, v6, OS_LOG_TYPE_INFO, "IGNORING_CACHE: %@ - %@", buf, 0x16u);
      }

      if (v5)
      {
        _ISPrepareISIconSignpostLog();
        v7 = objc_claimAutoreleasedReturnValue();
        v8 = os_signpost_enabled(v7);

        if (v8)
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "IGNORING_CACHE: %@ - %@");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", v9, self, v5);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          -[ISIcon _eventPrepareISIconSignpost:message:](self, "_eventPrepareISIconSignpost:message:", v5, v10);

        }
      }
      v11 = 0;
    }
    else
    {
      -[ISConcreteIcon _cachedImageForDescriptor:](self, "_cachedImageForDescriptor:", v5);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
    }
    if (objc_msgSend(v11, "placeholder"))
    {
      _ISDefaultLog();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412546;
        v25 = self;
        v26 = 2112;
        v27 = v5;
        _os_log_impl(&dword_1AA928000, v12, OS_LOG_TYPE_INFO, "%@ RETURNING_STALE_PLACEHOLDER: %@", buf, 0x16u);
      }

      if (v5)
      {
        _ISPrepareISIconSignpostLog();
        v13 = objc_claimAutoreleasedReturnValue();
        v14 = os_signpost_enabled(v13);

        if (v14)
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "%@ RETURNING_STALE_PLACEHOLDER: %@");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", v15, self, v5);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          -[ISIcon _eventPrepareISIconSignpost:message:](self, "_eventPrepareISIconSignpost:message:", v5, v16);

LABEL_26:
        }
      }
    }
    else if (!v11)
    {
      _ISDefaultLog();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412546;
        v25 = self;
        v26 = 2112;
        v27 = v5;
        _os_log_impl(&dword_1AA928000, v17, OS_LOG_TYPE_INFO, "%@ RETURNING_PLACEHOLDER: %@", buf, 0x16u);
      }

      if (v5)
      {
        _ISPrepareISIconSignpostLog();
        v18 = objc_claimAutoreleasedReturnValue();
        v19 = os_signpost_enabled(v18);

        if (v19)
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "%@ RETURNING_PLACEHOLDER: %@");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", v20, self, v5);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          -[ISIcon _eventPrepareISIconSignpost:message:](self, "_eventPrepareISIconSignpost:message:", v5, v21);

        }
      }
      v22 = (void *)MEMORY[0x1E0D3A7C0];
      -[ISConcreteIcon _fallbackKey](self, "_fallbackKey");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "_placeholderImageWithImageDescriptor:markAsPlaceholder:fallbackTypeID:referenceIcon:", v4, 1, v15, self);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_26;
    }
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[ISConcreteIcon _imageForSymbolImageDescriptor:](self, "_imageForSymbolImageDescriptor:", v5);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v11 = 0;
    }
  }

  return v11;
}

- (id)_imageFromStoreForDescriptor:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  ISConcreteIcon *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  NSObject *v20;
  ISConcreteIcon *v21;
  NSObject *v22;
  _BOOL4 v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  NSObject *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  id v32;
  id v34;
  id v35;
  uint8_t buf[4];
  ISConcreteIcon *v37;
  __int16 v38;
  id v39;
  __int16 v40;
  void *v41;
  __int16 v42;
  void *v43;
  __int16 v44;
  uint64_t v45;
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[ISIcon manager](self, "manager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "iconCache");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = 0;
  v35 = 0;
  v7 = objc_msgSend(v6, "findStoreUnitForIcon:descriptor:UUID:validationToken:", self, v4, &v35, &v34);
  v8 = (ISConcreteIcon *)v35;
  v9 = v34;

  v10 = 0;
  if (v7)
  {
    -[ISIcon manager](self, "manager");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "iconCache");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "storeUnitForUUID:", v8);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v13, "data");
    v14 = objc_claimAutoreleasedReturnValue();
    if (v14
      && (v15 = (void *)v14,
          objc_msgSend(v13, "UUID"),
          v16 = (void *)objc_claimAutoreleasedReturnValue(),
          v16,
          v15,
          v16))
    {
      v17 = objc_alloc(MEMORY[0x1E0D3A7C0]);
      objc_msgSend(v13, "data");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "UUID");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = (void *)objc_msgSend(v17, "initWithData:uuid:validationToken:", v18, v19, v9);

      _ISDefaultLog();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(v10, "uuid");
        v21 = (ISConcreteIcon *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v37 = v21;
        _os_log_impl(&dword_1AA928000, v20, OS_LOG_TYPE_INFO, "SATISFIED_PERSISTENT_CACHE: %@", buf, 0xCu);

      }
      if (v4)
      {
        _ISPrepareISIconSignpostLog();
        v22 = objc_claimAutoreleasedReturnValue();
        v23 = os_signpost_enabled(v22);

        if (v23)
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "SATISFIED_PERSISTENT_CACHE: %@");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          v25 = (void *)MEMORY[0x1E0CB3940];
          objc_msgSend(v10, "uuid");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "stringWithFormat:", v24, v26);
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          -[ISIcon _eventPrepareISIconSignpost:message:](self, "_eventPrepareISIconSignpost:message:", v4, v27);

        }
      }
      if (v10 && objc_msgSend(v10, "CGImage"))
        goto LABEL_17;
      _ISDefaultLog();
      v28 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_FAULT))
      {
        objc_msgSend(v13, "UUID");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "UUIDString");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = objc_msgSend(v10, "CGImage");
        *(_DWORD *)buf = 138413314;
        v37 = self;
        v38 = 2112;
        v39 = v4;
        v40 = 2112;
        v41 = v30;
        v42 = 2112;
        v43 = v10;
        v44 = 2112;
        v45 = v31;
        _os_log_fault_impl(&dword_1AA928000, v28, OS_LOG_TYPE_FAULT, "Failed to retrieve persistent cache entry. %@ - %@ with unitUUID: %@. Image: %@. Backing: %@", buf, 0x34u);

      }
    }
    else
    {
      _ISDefaultLog();
      v28 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v37 = v8;
        _os_log_impl(&dword_1AA928000, v28, OS_LOG_TYPE_DEFAULT, "Store Unit: %@ not found.", buf, 0xCu);
      }
      v10 = 0;
    }

LABEL_17:
  }
  v32 = v10;

  return v32;
}

- (unint64_t)hash
{
  void *v2;
  uint64_t v3;
  objc_class *v4;
  void *v5;
  unint64_t v6;

  -[ISConcreteIcon digest](self, "digest");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v3;

  return v6;
}

- (NSUUID)digest
{
  return (NSUUID *)objc_getProperty(self, a2, 24, 1);
}

- (id)_cachedImageForDescriptor:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  void *v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  NSObject *v30;
  double v31;
  double v32;
  double v33;
  uint64_t v34;
  void *v35;
  void *v36;
  unint64_t v37;
  NSObject *v38;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  int v49;
  ISConcreteIcon *v50;
  __int16 v51;
  id v52;
  __int16 v53;
  uint64_t v54;
  __int16 v55;
  uint64_t v56;
  __int16 v57;
  uint64_t v58;
  __int16 v59;
  uint64_t v60;
  __int16 v61;
  uint64_t v62;
  __int16 v63;
  int v64;
  __int16 v65;
  void *v66;
  uint64_t v67;

  v67 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[ISImageCache imageForDescriptor:](self->_imageCache, "imageForDescriptor:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D3A7B8], "defaultIconSpecification");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "maxSize");
  v8 = v7;

  objc_msgSend(MEMORY[0x1E0D3A7B8], "defaultIconSpecification");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "maxScale");
  v11 = v10;

  if (!v5
    || (objc_msgSend(v5, "iconSize"), v13 = v12, objc_msgSend(v4, "size"), v13 >= v14)
    || (objc_msgSend(v5, "iconSize"), v15 == v8) && (objc_msgSend(v5, "scale"), v16 == v11))
  {
    objc_msgSend(v5, "minimumSize");
    v32 = v31;
    objc_msgSend(v4, "size");
    if (v32 > v33)
    {
      v34 = objc_msgSend(objc_alloc(MEMORY[0x1E0D3A7D8]), "initWithImage:", v5);

      v5 = (void *)v34;
    }
    if (!v5)
      goto LABEL_16;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D3A7B8], "iosDocumentIconSpecification");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "size");
    v19 = v18;
    v21 = v20;
    objc_msgSend(v4, "scale");
    objc_msgSend(v17, "imageSpecificationForSize:scale:", v19, v21, v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "iconSize");
    v25 = v24;
    objc_msgSend(v23, "size");
    if (v25 == v26 && (objc_msgSend(v5, "iconSize"), v28 = v27, objc_msgSend(v23, "size"), v28 == v29))
    {
      _ISDefaultLog();
      v30 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
        -[ISConcreteIcon _cachedImageForDescriptor:].cold.1();

    }
    else
    {

      v5 = 0;
    }

    if (!v5)
    {
LABEL_16:
      -[ISConcreteIcon _imageFromStoreForDescriptor:](self, "_imageFromStoreForDescriptor:", v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      if (v5)
        -[ISImageCache setImage:forDescriptor:](self->_imageCache, "setImage:forDescriptor:", v5, v4);
    }
  }
  objc_msgSend(v5, "validationToken");
  v35 = (void *)objc_claimAutoreleasedReturnValue();

  if (v35)
  {
    objc_msgSend(v5, "validationToken");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = -[ISConcreteIcon assessValidationToken:](self, "assessValidationToken:", v36);

    objc_msgSend(v5, "setPlaceholder:", v37 == 2);
  }
  if (v5)
  {
    _ISDefaultLog();
    v38 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(v4, "size");
      v41 = v40;
      objc_msgSend(v5, "size");
      v43 = v42;
      objc_msgSend(v4, "size");
      v45 = v44;
      objc_msgSend(v5, "size");
      v47 = v46;
      objc_msgSend(v5, "scale");
      v49 = 138414338;
      v50 = self;
      v51 = 2112;
      v52 = v4;
      v53 = 2048;
      v54 = v41;
      v55 = 2048;
      v56 = v43;
      v57 = 2048;
      v58 = v45;
      v59 = 2048;
      v60 = v47;
      v61 = 2048;
      v62 = v48;
      v63 = 1024;
      v64 = objc_msgSend(v5, "placeholder");
      v65 = 2112;
      v66 = v5;
    }

  }
  return v5;
}

- (unint64_t)assessValidationToken:(id)a3
{
  id v4;
  void *v5;
  int v6;
  NSObject *v7;
  unint64_t v8;
  _BOOL4 v9;
  NSObject *v10;
  void *v11;
  int v12;
  NSObject *v13;
  _BOOL4 v14;
  void *v15;
  int v16;
  NSObject *v17;
  _BOOL4 v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  NSObject *v22;
  void *v23;
  NSObject *v24;
  NSObject *v25;
  uint64_t v26;
  int v27;
  NSObject *v28;
  _BOOL4 v29;
  NSObject *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  NSObject *v44;
  _BOOL4 v45;
  NSObject *v46;
  _BOOL4 v47;
  id v48;
  uint64_t v49;
  unsigned __int8 uu2[8];
  uint64_t v51;
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99D50], "_is_invalidToken");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "isEqual:", v5);

  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0C99D50], "_is_staleToken");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v4, "isEqual:", v11);

    if (v12)
    {
      _ISTraceLog();
      v13 = objc_claimAutoreleasedReturnValue();
      v14 = os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG);

      if (v14)
      {
        _ISTraceLog();
        v10 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
          -[ISConcreteIcon assessValidationToken:].cold.2();
        v8 = 1;
        goto LABEL_35;
      }
      v8 = 1;
      goto LABEL_36;
    }
    objc_msgSend(MEMORY[0x1E0C99D50], "_is_validToken");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v4, "isEqual:", v15);

    if (v16)
    {
      _ISTraceLog();
      v17 = objc_claimAutoreleasedReturnValue();
      v18 = os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG);

      if (v18)
      {
        _ISTraceLog();
        v10 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
          -[ISConcreteIcon assessValidationToken:].cold.3();
        v8 = 0;
        goto LABEL_35;
      }
      v8 = 0;
      goto LABEL_36;
    }
    v48 = 0;
    v49 = 0;
    objc_msgSend(MEMORY[0x1E0CA5900], "_is_getSequenceNumber:andUUID:", &v49, &v48);
    v10 = v48;
    *(_QWORD *)uu2 = 0;
    v51 = 0;
    -[NSObject getUUIDBytes:](v10, "getUUIDBytes:", uu2);
    if (objc_msgSend(v4, "length") == 40)
    {
      v19 = objc_retainAutorelease(v4);
      v20 = objc_msgSend(v19, "bytes");
      if (v20)
      {
        v21 = v20;
        if (*(_QWORD *)(v20 + 16) == v49 && !uuid_compare((const unsigned __int8 *)v20, uu2))
        {
          _ISDefaultLog();
          v24 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
            -[ISConcreteIcon assessValidationToken:].cold.5();
          v8 = 0;
          goto LABEL_34;
        }
        _ISDefaultLog();
        v22 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
          -[ISConcreteIcon assessValidationToken:].cold.10();

        -[ISConcreteIcon imageCache](self, "imageCache");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "latestValidationToken");
        v24 = objc_claimAutoreleasedReturnValue();

        if (-[NSObject length](v24, "length") == 40)
        {
          v25 = objc_retainAutorelease(v24);
          v26 = -[NSObject bytes](v25, "bytes");
          if (v26)
          {
            v27 = uuid_compare((const unsigned __int8 *)(v26 + 24), (const unsigned __int8 *)(v21 + 24));
            _ISTraceLog();
            v28 = objc_claimAutoreleasedReturnValue();
            v29 = os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG);

            if (v27)
            {
              if (v29)
              {
                _ISTraceLog();
                v30 = objc_claimAutoreleasedReturnValue();
                v8 = 2;
                if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
                {
                  -[ISConcreteIcon assessValidationToken:].cold.8();
LABEL_46:
                  v8 = 2;
                }
LABEL_51:

                goto LABEL_34;
              }
              v8 = 2;
            }
            else
            {
              if (v29)
              {
                _ISTraceLog();
                v30 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
                  -[ISConcreteIcon assessValidationToken:].cold.7();
                v8 = 1;
                goto LABEL_51;
              }
              v8 = 1;
            }
LABEL_54:
            v24 = v25;
            goto LABEL_34;
          }
          _ISTraceLog();
          v46 = objc_claimAutoreleasedReturnValue();
          v8 = 2;
          v47 = os_log_type_enabled(v46, OS_LOG_TYPE_DEBUG);

          if (!v47)
            goto LABEL_54;
          _ISTraceLog();
          v30 = objc_claimAutoreleasedReturnValue();
          v8 = 2;
          if (!os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
            goto LABEL_51;
LABEL_45:
          -[ISConcreteIcon assessValidationToken:].cold.6();
          goto LABEL_46;
        }
        _ISTraceLog();
        v44 = objc_claimAutoreleasedReturnValue();
        v8 = 2;
        v45 = os_log_type_enabled(v44, OS_LOG_TYPE_DEBUG);

        if (v45)
        {
          _ISTraceLog();
          v30 = objc_claimAutoreleasedReturnValue();
          v8 = 2;
          if (!os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
            goto LABEL_51;
          goto LABEL_45;
        }
LABEL_34:

LABEL_35:
        goto LABEL_36;
      }
      _ISDefaultLog();
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_FAULT))
        -[ISConcreteIcon assessValidationToken:].cold.4((uint64_t)v19, v24, v37, v38, v39, v40, v41, v42);
    }
    else
    {
      _ISDefaultLog();
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_FAULT))
        -[ISConcreteIcon assessValidationToken:].cold.11((uint64_t)v4, v24, v31, v32, v33, v34, v35, v36);
    }
    v8 = 2;
    goto LABEL_34;
  }
  _ISTraceLog();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = 2;
  v9 = os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG);

  if (v9)
  {
    _ISTraceLog();
    v10 = objc_claimAutoreleasedReturnValue();
    v8 = 2;
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      -[ISConcreteIcon assessValidationToken:].cold.1();
      v8 = 2;
    }
    goto LABEL_35;
  }
LABEL_36:

  return v8;
}

- (ISConcreteIcon)initWithDigest:(id)a3
{
  id v5;
  ISConcreteIcon *v6;
  ISImageCache *v7;
  ISImageCache *imageCache;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)ISConcreteIcon;
  v6 = -[ISCodableIcon _init](&v10, sel__init);
  if (v6)
  {
    v7 = objc_alloc_init(ISImageCache);
    imageCache = v6->_imageCache;
    v6->_imageCache = v7;

    objc_storeStrong((id *)&v6->_digest, a3);
  }

  return v6;
}

- (ISImageCache)imageCache
{
  return (ISImageCache *)objc_getProperty(self, a2, 32, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageCache, 0);
  objc_storeStrong((id *)&self->_digest, 0);
}

- (BOOL)isEqual:(id)a3
{
  ISConcreteIcon *v4;
  BOOL v5;

  v4 = (ISConcreteIcon *)a3;
  if (v4 == self)
  {
    v5 = 1;
  }
  else
  {
    objc_opt_class();
    v5 = (objc_opt_isKindOfClass() & 1) != 0 && -[ISConcreteIcon isEqualToIcon:](self, "isEqualToIcon:", v4);
  }

  return v5;
}

- (BOOL)isEqualToIcon:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[ISConcreteIcon digest](self, "digest");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "digest");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v4) = objc_msgSend(v5, "isEqual:", v6);
  return (char)v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[ISConcreteIcon digest](self, "digest");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("digest"));

}

- (ISConcreteIcon)initWithCoder:(id)a3
{
  id v4;
  ISConcreteIcon *v5;
  uint64_t v6;
  NSUUID *digest;
  ISImageCache *v8;
  ISImageCache *imageCache;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)ISConcreteIcon;
  v5 = -[ISCodableIcon initWithCoder:](&v11, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("digest"));
    v6 = objc_claimAutoreleasedReturnValue();
    digest = v5->_digest;
    v5->_digest = (NSUUID *)v6;

    v8 = objc_alloc_init(ISImageCache);
    imageCache = v5->_imageCache;
    v5->_imageCache = v8;

  }
  return v5;
}

- (id)_fallbackKey
{
  return (id)*MEMORY[0x1E0CA5BA0];
}

- (id)makeResourceProvider
{
  id v2;

  objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", CFSTR("Abstract method called."), 0, 0);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v2);
}

- (id)generateImageWithDescriptor:(id)a3
{
  id v4;
  ISGenerationRequest *v5;
  id v6;
  ISGenerationRequest *v7;
  id v8;
  id v9;
  _QWORD v11[5];
  id v12;
  ISGenerationRequest *v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;

  v4 = a3;
  v5 = objc_alloc_init(ISGenerationRequest);
  -[ISGenerationRequest setImageDescriptor:](v5, "setImageDescriptor:", v4);
  -[ISGenerationRequest setIcon:](v5, "setIcon:", self);
  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__0;
  v19 = __Block_byref_object_dispose__0;
  v20 = 0;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __46__ISConcreteIcon_generateImageWithDescriptor___block_invoke;
  v11[3] = &unk_1E5800B80;
  v11[4] = self;
  v6 = v4;
  v12 = v6;
  v7 = v5;
  v13 = v7;
  v14 = &v15;
  v8 = _ISRetryRequest((uint64_t)v11);
  v9 = (id)v16[5];

  _Block_object_dispose(&v15, 8);
  return v9;
}

id __46__ISConcreteIcon_generateImageWithDescriptor___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  void *v11;
  id v12;
  _QWORD v14[5];
  id v15;
  uint64_t v16;
  _QWORD v17[5];
  id v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;

  v20 = 0;
  v21 = &v20;
  v22 = 0x3032000000;
  v23 = __Block_byref_object_copy__0;
  v24 = __Block_byref_object_dispose__0;
  v25 = 0;
  objc_msgSend(*(id *)(a1 + 32), "manager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "connection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = MEMORY[0x1E0C809B0];
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __46__ISConcreteIcon_generateImageWithDescriptor___block_invoke_2;
  v17[3] = &unk_1E5800B30;
  v5 = *(void **)(a1 + 40);
  v17[4] = *(_QWORD *)(a1 + 32);
  v18 = v5;
  v19 = &v20;
  objc_msgSend(v3, "synchronousRemoteObjectProxyWithErrorHandler:", v17);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v14[0] = v4;
  v14[1] = 3221225472;
  v14[2] = __46__ISConcreteIcon_generateImageWithDescriptor___block_invoke_17;
  v14[3] = &unk_1E5800B58;
  v7 = *(void **)(a1 + 40);
  v8 = *(_QWORD *)(a1 + 48);
  v14[4] = *(_QWORD *)(a1 + 32);
  v9 = v7;
  v10 = *(_QWORD *)(a1 + 56);
  v15 = v9;
  v16 = v10;
  objc_msgSend(v6, "generateImageWithRequest:reply:", v8, v14);
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40))
    v11 = 0;
  else
    v11 = (void *)v21[5];
  v12 = v11;

  _Block_object_dispose(&v20, 8);
  return v12;
}

void __46__ISConcreteIcon_generateImageWithDescriptor___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;

  v3 = a2;
  _ISDefaultLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __46__ISConcreteIcon_generateImageWithDescriptor___block_invoke_2_cold_1();

  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v3;

}

void __46__ISConcreteIcon_generateImageWithDescriptor___block_invoke_17(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;

  v3 = a2;
  objc_msgSend(v3, "error");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    _ISDefaultLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      __46__ISConcreteIcon_generateImageWithDescriptor___block_invoke_17_cold_1(a1, v3, v5);

  }
  else
  {
    v6 = objc_alloc(MEMORY[0x1E0D3A7C0]);
    objc_msgSend(v3, "data");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "uuid");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "validationToken");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v6, "initWithData:uuid:validationToken:", v7, v8, v9);
    v11 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v12 = *(void **)(v11 + 40);
    *(_QWORD *)(v11 + 40) = v10;

  }
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40))
  {
    v13 = (void *)MEMORY[0x1E0D3A7C0];
    v14 = *(_QWORD *)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 32), "_fallbackKey");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "_placeholderImageWithImageDescriptor:markAsPlaceholder:fallbackTypeID:referenceIcon:", v14, 0, v15, *(_QWORD *)(a1 + 32));
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v18 = *(void **)(v17 + 40);
    *(_QWORD *)(v17 + 40) = v16;

  }
}

- (void)_prepareImagesForImageDescriptors:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  double v11;
  void *v12;
  double v13;
  double v14;
  NSObject *v15;
  NSObject *v16;
  _BOOL4 v17;
  void *v18;
  void *v19;
  NSObject *v20;
  NSObject *v21;
  _BOOL4 v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  unint64_t v27;
  NSObject *v28;
  NSObject *v29;
  _BOOL4 v30;
  void *v31;
  void *v32;
  void *v33;
  id obj;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  uint8_t buf[4];
  ISConcreteIcon *v40;
  __int16 v41;
  double v42;
  __int16 v43;
  double v44;
  _BYTE v45[128];
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  obj = a3;
  v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v45, 16);
  if (v4)
  {
    v5 = v4;
    v6 = 0x1E57FF000uLL;
    v7 = *(_QWORD *)v36;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v36 != v7)
          objc_enumerationMutation(obj);
        v9 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * i);
        v10 = (void *)MEMORY[0x1AF423108]();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v11 = COERCE_DOUBLE(objc_msgSend(v9, "copy"));
          +[ISDefaults sharedInstance](ISDefaults, "sharedInstance");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "prepareImageDelay");
          v14 = v13;

          if (v14 > 0.0)
          {
            _ISDefaultLog();
            v15 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412802;
              v40 = self;
              v41 = 2048;
              v42 = v14 * 1000000.0;
              v43 = 2112;
              v44 = v11;
              _os_log_impl(&dword_1AA928000, v15, OS_LOG_TYPE_INFO, "DELAYING_PREPARE: %@ - delay: %lf , %@", buf, 0x20u);
            }

            if (v11 != 0.0)
            {
              _ISPrepareISIconSignpostLog();
              v16 = objc_claimAutoreleasedReturnValue();
              v17 = os_signpost_enabled(v16);

              if (v17)
              {
                objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "DELAYING_PREPARE: %@ - delay: %lf , %@");
                v18 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", v18, self, v14 * 1000000.0, *(_QWORD *)&v11);
                v19 = (void *)objc_claimAutoreleasedReturnValue();
                -[ISIcon _eventPrepareISIconSignpost:message:](self, "_eventPrepareISIconSignpost:message:", *(_QWORD *)&v11, v19);

              }
            }
            usleep((v14 * 1000000.0));
          }
          if (objc_msgSend(*(id *)&v11, "ignoreCache"))
          {
            _ISDefaultLog();
            v20 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412546;
              v40 = self;
              v41 = 2112;
              v42 = v11;
              _os_log_impl(&dword_1AA928000, v20, OS_LOG_TYPE_INFO, "PREPARE_IGNORING_CACHE: %@ - %@", buf, 0x16u);
            }

            if (v11 != 0.0)
            {
              _ISPrepareISIconSignpostLog();
              v21 = objc_claimAutoreleasedReturnValue();
              v22 = os_signpost_enabled(v21);

              if (v22)
              {
                objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "PREPARE_IGNORING_CACHE: %@ - %@");
                v23 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", v23, self, *(_QWORD *)&v11);
                v24 = (void *)objc_claimAutoreleasedReturnValue();
                -[ISIcon _eventPrepareISIconSignpost:message:](self, "_eventPrepareISIconSignpost:message:", *(_QWORD *)&v11, v24);

              }
            }
            v25 = 0;
LABEL_23:
            v27 = v6;
            _ISDefaultLog();
            v28 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412546;
              v40 = self;
              v41 = 2112;
              v42 = v11;
              _os_log_impl(&dword_1AA928000, v28, OS_LOG_TYPE_INFO, "PREPARE_IMAGE: %@ - %@", buf, 0x16u);
            }

            if (v11 != 0.0)
            {
              _ISPrepareISIconSignpostLog();
              v29 = objc_claimAutoreleasedReturnValue();
              v30 = os_signpost_enabled(v29);

              if (v30)
              {
                objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "PREPARE_IMAGE: %@ - %@");
                v31 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", v31, self, *(_QWORD *)&v11);
                v32 = (void *)objc_claimAutoreleasedReturnValue();
                -[ISIcon _eventPrepareISIconSignpost:message:](self, "_eventPrepareISIconSignpost:message:", *(_QWORD *)&v11, v32);

              }
            }
            -[ISConcreteIcon generateImageWithDescriptor:](self, "generateImageWithDescriptor:", *(_QWORD *)&v11);
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            -[ISImageCache setImage:forDescriptor:](self->_imageCache, "setImage:forDescriptor:", v33, *(_QWORD *)&v11);

            v6 = v27;
          }
          else
          {
            -[ISConcreteIcon _cachedImageForDescriptor:](self, "_cachedImageForDescriptor:", *(_QWORD *)&v11);
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            v25 = v26;
            if (!v26 || objc_msgSend(v26, "placeholder"))
              goto LABEL_23;
          }

        }
        objc_autoreleasePoolPop(v10);
      }
      v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v45, 16);
    }
    while (v5);
  }

}

- (id)_imageForSymbolImageDescriptor:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  -[ISConcreteIcon makeSymbolResourceProvider](self, "makeSymbolResourceProvider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "symbol");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "imageForDescriptor:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)symbol
{
  void *v3;
  void *v4;
  NSObject *v5;
  int v7;
  ISConcreteIcon *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  -[ISConcreteIcon makeSymbolResourceProvider](self, "makeSymbolResourceProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "symbol");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    _ISDefaultLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      v7 = 138412290;
      v8 = self;
      _os_log_impl(&dword_1AA928000, v5, OS_LOG_TYPE_INFO, "Failed to get symbol for %@", (uint8_t *)&v7, 0xCu);
    }

  }
  return v4;
}

- (void)generateImageWithDescriptor:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  ISGenerationRequest *v8;
  void *v9;
  uint64_t v10;
  id v11;
  id v12;
  ISGenerationRequest *v13;
  id v14;
  id v15;
  id v16;
  _QWORD v17[5];
  id v18;
  ISGenerationRequest *v19;
  id v20;
  _QWORD v21[5];
  id v22;
  id v23;

  v6 = a3;
  v7 = a4;
  v8 = objc_alloc_init(ISGenerationRequest);
  v9 = (void *)objc_msgSend(v6, "copy");
  -[ISGenerationRequest setImageDescriptor:](v8, "setImageDescriptor:", v9);

  -[ISGenerationRequest setIcon:](v8, "setIcon:", self);
  v10 = MEMORY[0x1E0C809B0];
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __57__ISConcreteIcon_generateImageWithDescriptor_completion___block_invoke;
  v21[3] = &unk_1E5800BA8;
  v21[4] = self;
  v11 = v6;
  v22 = v11;
  v23 = v7;
  v12 = v7;
  v17[0] = v10;
  v17[1] = 3221225472;
  v17[2] = __57__ISConcreteIcon_generateImageWithDescriptor_completion___block_invoke_29;
  v17[3] = &unk_1E5800BF8;
  v17[4] = self;
  v18 = v11;
  v19 = v8;
  v20 = (id)MEMORY[0x1AF4232B8](v21);
  v13 = v8;
  v14 = v20;
  v15 = v11;
  v16 = _ISRetryRequest((uint64_t)v17);

}

void __57__ISConcreteIcon_generateImageWithDescriptor_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;

  v3 = a2;
  objc_msgSend(v3, "error");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    _ISDefaultLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      __46__ISConcreteIcon_generateImageWithDescriptor___block_invoke_17_cold_1(a1, v3, v5);

  }
  else
  {
    v10 = objc_alloc(MEMORY[0x1E0D3A7C0]);
    objc_msgSend(v3, "data");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "uuid");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "validationToken");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v10, "initWithData:uuid:validationToken:", v11, v12, v13);

    if (v9)
      goto LABEL_7;
  }
  v6 = (void *)MEMORY[0x1E0D3A7C0];
  v7 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "_fallbackKey");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_placeholderImageWithImageDescriptor:markAsPlaceholder:fallbackTypeID:referenceIcon:", v7, 0, v8, *(_QWORD *)(a1 + 32));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_7:
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

id __57__ISConcreteIcon_generateImageWithDescriptor_completion___block_invoke_29(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(uint64_t, void *);
  void *v11;
  uint64_t v12;
  id v13;
  id v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;

  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__0;
  v20 = __Block_byref_object_dispose__0;
  v21 = 0;
  objc_msgSend(*(id *)(a1 + 32), "manager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "connection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x1E0C809B0];
  v9 = 3221225472;
  v10 = __57__ISConcreteIcon_generateImageWithDescriptor_completion___block_invoke_2;
  v11 = &unk_1E5800BD0;
  v4 = *(void **)(a1 + 40);
  v12 = *(_QWORD *)(a1 + 32);
  v13 = v4;
  v15 = &v16;
  v14 = *(id *)(a1 + 56);
  objc_msgSend(v3, "remoteObjectProxyWithErrorHandler:", &v8);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "generateImageWithRequest:reply:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), v8, v9, v10, v11, v12);
  v6 = (id)v17[5];

  _Block_object_dispose(&v16, 8);
  return v6;
}

void __57__ISConcreteIcon_generateImageWithDescriptor_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  id v7;
  uint64_t v8;
  ISGenerationResponse *v9;

  v3 = a2;
  _ISDefaultLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __57__ISConcreteIcon_generateImageWithDescriptor_completion___block_invoke_2_cold_1();

  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v3;
  v7 = v3;

  v8 = *(_QWORD *)(a1 + 48);
  v9 = -[ISGenerationResponse initWithError:]([ISGenerationResponse alloc], "initWithError:", v7);
  (*(void (**)(uint64_t, ISGenerationResponse *))(v8 + 16))(v8, v9);

}

- (void)getImageForImageDescriptor:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(id, void *);
  void *v8;
  void *v9;
  uint64_t v10;
  _QWORD v11[5];
  id v12;
  void (**v13)(id, void *);

  v6 = a3;
  v7 = (void (**)(id, void *))a4;
  -[ISConcreteIcon imageForDescriptor:](self, "imageForDescriptor:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if ((v8 && !objc_msgSend(v8, "placeholder")
     || (-[ISConcreteIcon _imageFromStoreForDescriptor:](self, "_imageFromStoreForDescriptor:", v6),
         v10 = objc_claimAutoreleasedReturnValue(),
         v9,
         (v9 = (void *)v10) != 0))
    && !objc_msgSend(v9, "placeholder"))
  {
    v7[2](v7, v9);
  }
  else
  {
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __56__ISConcreteIcon_getImageForImageDescriptor_completion___block_invoke;
    v11[3] = &unk_1E5800C20;
    v11[4] = self;
    v12 = v6;
    v13 = v7;
    -[ISConcreteIcon generateImageWithDescriptor:completion:](self, "generateImageWithDescriptor:completion:", v12, v11);

  }
}

void __56__ISConcreteIcon_getImageForImageDescriptor_completion___block_invoke(_QWORD *a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;

  v3 = (void *)a1[4];
  v5 = a2;
  objc_msgSend(v3, "imageCache");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setImage:forDescriptor:", v5, a1[5]);

  (*(void (**)(void))(a1[6] + 16))();
}

- (double)_aspectRatio
{
  return 0.75;
}

- (void)_cachedImageForDescriptor:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_0_2(&dword_1AA928000, v0, v1, "Accepting image with document icon dimensions match", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_1();
}

- (void)assessValidationToken:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_0_2(&dword_1AA928000, v0, v1, "VALIDATION_TOKEN_ASSMENT: invalid - constant", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_1();
}

- (void)assessValidationToken:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_0_2(&dword_1AA928000, v0, v1, "VALIDATION_TOKEN_ASSMENT: stale - constant", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_1();
}

- (void)assessValidationToken:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_0_2(&dword_1AA928000, v0, v1, "VALIDATION_TOKEN_ASSMENT: valid - constant", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_1();
}

- (void)assessValidationToken:(uint64_t)a3 .cold.4(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_7(&dword_1AA928000, a2, a3, "Invalid validation token data: %@", a5, a6, a7, a8, 2u);
}

- (void)assessValidationToken:.cold.5()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_0_2(&dword_1AA928000, v0, v1, "VALIDATION_TOKEN_ASSMENT: valid - LSDB state match", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_1();
}

- (void)assessValidationToken:.cold.6()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_0_2(&dword_1AA928000, v0, v1, "VALIDATION_TOKEN_ASSMENT: invalid - no local validation token", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_1();
}

- (void)assessValidationToken:.cold.7()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_0_2(&dword_1AA928000, v0, v1, "VALIDATION_TOKEN_ASSMENT: stale - resource UUID match", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_1();
}

- (void)assessValidationToken:.cold.8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_0_2(&dword_1AA928000, v0, v1, "VALIDATION_TOKEN_ASSMENT: invalid - resource UUID changed", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_1();
}

- (void)assessValidationToken:.cold.10()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_0_2(&dword_1AA928000, v0, v1, "VALIDATION_TOKEN_ASSMENT: LSDB state missmatch", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_1();
}

- (void)assessValidationToken:(uint64_t)a3 .cold.11(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_7(&dword_1AA928000, a2, a3, "Invalid validation token data size: %@", a5, a6, a7, a8, 2u);
}

void __46__ISConcreteIcon_generateImageWithDescriptor___block_invoke_2_cold_1()
{
  NSObject *v0;
  uint8_t v1[40];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_3_1(&dword_1AA928000, v0, (uint64_t)v0, "Failed to generate image for %@ - %@. Error: %@", v1);
}

void __46__ISConcreteIcon_generateImageWithDescriptor___block_invoke_17_cold_1(uint64_t a1, void *a2, NSObject *a3)
{
  void *v4;
  uint64_t v5;
  uint8_t v6[40];
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a2, "error");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_3_1(&dword_1AA928000, a3, v5, "Error returned from iconservicesagent image request: %@ - %@ error: %@", v6);

  OUTLINED_FUNCTION_0_1();
}

void __57__ISConcreteIcon_generateImageWithDescriptor_completion___block_invoke_2_cold_1()
{
  NSObject *v0;
  uint8_t v1[40];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_3_1(&dword_1AA928000, v0, (uint64_t)v0, "Failed to generate image with handler for %@ - %@. Error: %@", v1);
}

@end
