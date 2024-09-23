@implementation _NTKPhotosPhotoFaceUpgradeContext

- (_NTKPhotosPhotoFaceUpgradeContext)initWithReader:(id)a3 contentOption:(id)a4 positionOption:(id)a5 topComplication:(id)a6 bottomComplication:(id)a7 colorOption:(id)a8
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  _NTKPhotosPhotoFaceUpgradeContext *v20;
  _NTKPhotosPhotoFaceUpgradeContext *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  NSString *albumIdentifier;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  NSString *v32;
  NSString *v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  void *v37;
  int v38;
  int v39;
  uint64_t v40;
  NSObject *v41;
  uint64_t v43;
  void *v44;
  void *v45;
  void *v46;
  id v47;
  objc_super v48;
  uint8_t buf[4];
  _NTKPhotosPhotoFaceUpgradeContext *v50;
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  v15 = a3;
  v16 = a4;
  v17 = a5;
  v47 = a6;
  v18 = a7;
  v19 = a8;
  v48.receiver = self;
  v48.super_class = (Class)_NTKPhotosPhotoFaceUpgradeContext;
  v20 = -[_NTKPhotosPhotoFaceUpgradeContext init](&v48, sel_init);
  v21 = v20;
  if (!v20)
    goto LABEL_25;
  objc_storeStrong((id *)&v20->_reader, a3);
  objc_storeStrong((id *)&v21->_topComplication, a6);
  objc_storeStrong((id *)&v21->_bottomComplication, a7);
  v21->_contentType = 0;
  v22 = objc_msgSend(v16, "photosContent");
  if (v22 == 2)
  {
    v23 = 3;
LABEL_8:
    v21->_contentType = v23;
    goto LABEL_15;
  }
  if (v22 == 1)
  {
    v23 = 1;
    goto LABEL_8;
  }
  if (v22)
  {
    if (v21->_contentType != 2)
      goto LABEL_15;
  }
  else
  {
    v21->_contentType = 2;
  }
  objc_msgSend(v15, "assetCollectionIdentifier");
  v24 = objc_claimAutoreleasedReturnValue();
  albumIdentifier = v21->_albumIdentifier;
  v21->_albumIdentifier = (NSString *)v24;

  if (!v21->_albumIdentifier)
  {
    objc_msgSend(MEMORY[0x1E0C944B0], "currentDevice");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "nrDevice");
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    v46 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D515F8]), "initWithCollectionTarget:device:", 1, v27);
    objc_msgSend(v46, "assetCollections");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "anyObject");
    v29 = (void *)objc_claimAutoreleasedReturnValue();

    if (v29)
    {
      v44 = (void *)MEMORY[0x1E0CD13B8];
      NTK_npto_uuid(v29);
      v45 = v27;
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "UUIDString");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "localIdentifierWithUUID:", v31);
      v43 = objc_claimAutoreleasedReturnValue();

      v32 = (NSString *)v43;
      v27 = v45;
    }
    else
    {
      v32 = 0;
    }

    v33 = v21->_albumIdentifier;
    v21->_albumIdentifier = v32;

  }
LABEL_15:
  v21->_timeAlignment = 0;
  v34 = objc_msgSend(v17, "alignment", v43);
  if (v34)
  {
    if (v34 != 1)
      goto LABEL_20;
    v35 = 4;
  }
  else
  {
    v35 = 2;
  }
  v21->_timeAlignment = v35;
LABEL_20:
  objc_msgSend(v19, "optionName");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  +[NTKPhotosColorEditOption originalColorName](NTKPhotosColorEditOption, "originalColorName");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = objc_msgSend(v36, "isEqualToString:", v37);

  if (v38)
  {
    v21->_colorEffect = 0;
  }
  else
  {
    v39 = objc_msgSend(v19, "isMultitoneOption");
    v40 = 3;
    if (!v39)
      v40 = 1;
    v21->_colorEffect = v40;
    objc_storeStrong((id *)&v21->_colorOption, a8);
  }
LABEL_25:
  _NTKLoggingObjectForDomain(6, (uint64_t)"NTKLoggingDomainPhoto");
  v41 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v41, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v50 = v21;
    _os_log_impl(&dword_1B72A3000, v41, OS_LOG_TYPE_INFO, "Created %@", buf, 0xCu);
  }

  return v21;
}

- (NSString)description
{
  return (NSString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("_NTKPhotosPhotoFaceUpgradeContext[content=%ld, album=%@, %ld photos]"), self->_contentType, self->_albumIdentifier, -[NTKPhotosReader count](self->_reader, "count"));
}

- (int64_t)contentType
{
  return self->_contentType;
}

- (NSString)albumIdentifier
{
  return self->_albumIdentifier;
}

- (NTKComplication)topComplication
{
  return self->_topComplication;
}

- (NTKComplication)bottomComplication
{
  return self->_bottomComplication;
}

- (int64_t)colorEffect
{
  return self->_colorEffect;
}

- (NTKPigmentEditOption)colorOption
{
  return self->_colorOption;
}

- (int64_t)typeface
{
  return 0;
}

- (unint64_t)numberOfItems
{
  return -[NTKPhotosReader count](self->_reader, "count");
}

- (id)itemAtIndex:(unint64_t)a3
{
  void *v4;
  _NTKPhotosPhotoFaceUpgradeItemContext *v5;

  -[NTKPhotosReader objectAtIndexedSubscript:](self->_reader, "objectAtIndexedSubscript:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    v5 = -[_NTKPhotosPhotoFaceUpgradeItemContext initWithPhoto:timeAlignment:]([_NTKPhotosPhotoFaceUpgradeItemContext alloc], "initWithPhoto:timeAlignment:", v4, self->_timeAlignment);
  else
    v5 = 0;

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_colorOption, 0);
  objc_storeStrong((id *)&self->_bottomComplication, 0);
  objc_storeStrong((id *)&self->_topComplication, 0);
  objc_storeStrong((id *)&self->_reader, 0);
  objc_storeStrong((id *)&self->_albumIdentifier, 0);
}

@end
