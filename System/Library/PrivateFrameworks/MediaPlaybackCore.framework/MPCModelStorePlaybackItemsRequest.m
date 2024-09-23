@implementation MPCModelStorePlaybackItemsRequest

- (MPCModelStorePlaybackItemsRequest)init
{
  MPCModelStorePlaybackItemsRequest *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  MPCPlaybackRequestEnvironment *v14;
  MPCPlaybackRequestEnvironment *playbackRequestEnvironment;
  objc_super v17;
  _QWORD v18[2];
  _QWORD v19[2];
  _QWORD v20[3];

  v20[2] = *MEMORY[0x24BDAC8D0];
  v17.receiver = self;
  v17.super_class = (Class)MPCModelStorePlaybackItemsRequest;
  v2 = -[MPCModelStorePlaybackItemsRequest init](&v17, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BDDC9D8], "kindWithVariants:", 3);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDDC830], "kindWithSongKind:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)MEMORY[0x24BDDC950];
    v20[0] = v3;
    objc_msgSend(MEMORY[0x24BDDCA28], "kindWithVariants:", 3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v20[1] = v6;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v20, 2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "kindWithKinds:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDDC948], "kindWithVariants:playlistEntryKind:options:", 31, v8, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)MEMORY[0x24BDDC890];
    v11 = *MEMORY[0x24BDDC2B8];
    v18[0] = *MEMORY[0x24BDDC278];
    v18[1] = v11;
    v19[0] = v4;
    v19[1] = v9;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v19, v18, 2);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "kindWithRelationshipKinds:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    -[MPCModelStorePlaybackItemsRequest setItemKind:](v2, "setItemKind:", v13);
    -[MPCModelStorePlaybackItemsRequest setSectionKind:](v2, "setSectionKind:", v13);
    v14 = objc_alloc_init(MPCPlaybackRequestEnvironment);
    playbackRequestEnvironment = v2->_playbackRequestEnvironment;
    v2->_playbackRequestEnvironment = v14;

  }
  return v2;
}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  MPSectionedCollection *sectionedModelObjects;
  uint64_t v7;
  MPSectionedCollection *v8;
  id v9;
  void *v10;
  _QWORD v12[5];
  id v13;
  _QWORD *v14;
  uint64_t v15;
  _QWORD v16[4];
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)MPCModelStorePlaybackItemsRequest;
  -[MPCModelStorePlaybackItemsRequest description](&v17, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  objc_msgSend(v4, "deleteCharactersInRange:", objc_msgSend(v4, "length") - 1, 1);
  objc_msgSend(v4, "appendFormat:", CFSTR(" playbackRequestEnvironment=%@"), self->_playbackRequestEnvironment);
  if (-[NSArray count](self->_storeIDs, "count"))
  {
    -[NSArray msv_compactDescription](self->_storeIDs, "msv_compactDescription");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "appendFormat:", CFSTR(" storeIDs=[ %@ ]"), v5);

  }
  sectionedModelObjects = self->_sectionedModelObjects;
  if (sectionedModelObjects)
  {
    v7 = -[MPSectionedCollection numberOfSections](sectionedModelObjects, "numberOfSections");
    objc_msgSend(v4, "appendFormat:", CFSTR(" sectionedModelObjects=[ <%ld sections>\n"), v7);
    v16[0] = 0;
    v16[1] = v16;
    v16[2] = 0x2020000000;
    v8 = self->_sectionedModelObjects;
    v16[3] = 0;
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __48__MPCModelStorePlaybackItemsRequest_description__block_invoke;
    v12[3] = &unk_24CAB4028;
    v12[4] = self;
    v9 = v4;
    v13 = v9;
    v14 = v16;
    v15 = v7;
    -[MPSectionedCollection enumerateSectionsUsingBlock:](v8, "enumerateSectionsUsingBlock:", v12);
    objc_msgSend(v9, "appendString:", CFSTR("]"));

    _Block_object_dispose(v16, 8);
  }
  if (self->_trustProvider)
    objc_msgSend(v4, "appendFormat:", CFSTR(" trustProvider=[ %p ]"), self->_trustProvider);
  if (self->_inGroupSession)
    objc_msgSend(v4, "appendString:", CFSTR(" inGroupSession=YES"));
  objc_msgSend(v4, "appendString:", CFSTR(">"));
  v10 = (void *)objc_msgSend(v4, "copy");

  return (NSString *)v10;
}

- (NSString)clientIdentifier
{
  if (self->_clientIdentifier)
    return self->_clientIdentifier;
  else
    return (NSString *)&stru_24CABB5D0;
}

- (NSString)rtcReportingPlayQueueSourceIdentifier
{
  return (NSString *)CFSTR("queue-source.catalog");
}

- (id)newOperationWithResponseHandler:(id)a3
{
  id v4;
  __objc2_class **v5;
  void *v6;

  v4 = a3;
  if (-[MPCModelStorePlaybackItemsRequest useUniversalAccumulator](self, "useUniversalAccumulator")
    && (_os_feature_enabled_impl() & 1) != 0)
  {
    v5 = &off_24CAA37D8;
  }
  else
  {
    v5 = off_24CAA2E18;
  }
  v6 = (void *)objc_msgSend(objc_alloc(*v5), "initWithRequest:responseHandler:", self, v4);

  return v6;
}

- (MPCModelStorePlaybackItemsRequest)initWithCoder:(id)a3
{
  id v4;
  MPCModelStorePlaybackItemsRequest *v5;
  unint64_t v6;
  uint64_t v7;
  NSString *clientIdentifier;
  uint64_t v9;
  MPCPlaybackRequestEnvironment *playbackRequestEnvironment;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  NSArray *storeIDs;
  uint64_t v16;
  NSUUID *storeIDsAnonymousGroupUUID;
  uint64_t v18;
  NSUUID *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  uint64_t v25;
  unint64_t v26;
  uint64_t v27;
  uint64_t v28;
  NSString *v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  id v34;
  void *v35;
  int v36;
  void *v37;
  objc_class *v38;
  void *v39;
  uint64_t v40;
  void *v41;
  void *v42;
  id v43;
  void *v44;
  uint64_t v45;
  void *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  NSString *v50;
  void *v51;
  void *v52;
  id v53;
  id v54;
  void *v55;
  int v56;
  void *v57;
  objc_class *v58;
  void *v59;
  uint64_t v60;
  void *v61;
  void *v62;
  id v63;
  void *v64;
  uint64_t v65;
  void *v66;
  MPSectionedCollection *sectionedModelObjects;
  void *v69;
  id v70;
  MPCModelStorePlaybackItemsRequest *v71;
  void *v72;
  uint64_t v73;
  void *v74;
  void *v75;
  void *v76;
  NSString *v77;
  id v78;
  objc_super v79;

  v4 = a3;
  v79.receiver = self;
  v79.super_class = (Class)MPCModelStorePlaybackItemsRequest;
  v5 = -[MPCModelStorePlaybackItemsRequest initWithCoder:](&v79, sel_initWithCoder_, v4);
  if (v5)
  {
    v5->_allowLocalEquivalencies = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("MPCModelStorePlaybackItemsRequestAllowLocalEquivalencies"));
    v6 = 0x24BDD1000uLL;
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("MPCModelStorePlaybackItemsRequestClientIdentifier"));
    v7 = objc_claimAutoreleasedReturnValue();
    clientIdentifier = v5->_clientIdentifier;
    v5->_clientIdentifier = (NSString *)v7;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("MPCModelStorePlaybackItemsRequestPlaybackRequestEnvironment"));
    v9 = objc_claimAutoreleasedReturnValue();
    playbackRequestEnvironment = v5->_playbackRequestEnvironment;
    v5->_playbackRequestEnvironment = (MPCPlaybackRequestEnvironment *)v9;

    v11 = (void *)MEMORY[0x24BDBCF20];
    v12 = objc_opt_class();
    objc_msgSend(v11, "setWithObjects:", v12, objc_opt_class(), 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v13, CFSTR("MPCModelStorePlaybackItemsRequestStoreIDs"));
    v14 = objc_claimAutoreleasedReturnValue();
    storeIDs = v5->_storeIDs;
    v5->_storeIDs = (NSArray *)v14;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_MPCModelStorePlaybackItemsRequestCodingKeyStoreIDsUUID"));
    v16 = objc_claimAutoreleasedReturnValue();
    storeIDsAnonymousGroupUUID = v5->_storeIDsAnonymousGroupUUID;
    v5->_storeIDsAnonymousGroupUUID = (NSUUID *)v16;

    if (!v5->_storeIDsAnonymousGroupUUID)
    {
      objc_msgSend(MEMORY[0x24BDD1880], "UUID");
      v18 = objc_claimAutoreleasedReturnValue();
      v19 = v5->_storeIDsAnonymousGroupUUID;
      v5->_storeIDsAnonymousGroupUUID = (NSUUID *)v18;

    }
    v5->_inGroupSession = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_MPCModelStorePlaybackItemsRequestCodingKeyInGroupSession"));
    if (!v5->_storeIDs)
    {
      v20 = (void *)MEMORY[0x24BDBCF20];
      v21 = objc_opt_class();
      v22 = objc_opt_class();
      objc_msgSend(v20, "setWithObjects:", v21, v22, objc_opt_class(), 0);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v23, CFSTR("MPCModelStorePlaybackItemsRequestSectionedModelObjects"));
      v24 = (void *)objc_claimAutoreleasedReturnValue();

      if (v24)
      {
        v71 = v5;
        v72 = v4;
        v25 = objc_msgSend(v24, "count");
        v78 = objc_alloc_init(MEMORY[0x24BDDCA88]);
        v26 = 0x24BDDC000uLL;
        if (v25 >= 3)
        {
          v27 = 0;
          v28 = v25 - 2;
          v73 = v28;
          v74 = v24;
          while (1)
          {
            objc_msgSend(v24, "objectAtIndex:", v27);
            v29 = (NSString *)objc_claimAutoreleasedReturnValue();
            if (_NSIsNSString())
              v30 = NSClassFromString(v29);
            else
              v30 = 0;
            if (!objc_msgSend(v30, "isSubclassOfClass:", objc_opt_class()))
              goto LABEL_55;
            objc_msgSend(v24, "objectAtIndex:", v27 + 1);
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v24, "objectAtIndex:", v27 + 2);
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              if (_NSIsNSArray())
                break;
            }
LABEL_54:

LABEL_55:
            v27 += 3;
            if (v27 >= v28)
              goto LABEL_59;
          }
          v76 = v31;
          v77 = v29;
          v33 = v31;
          if ((void *)objc_opt_class() == v30)
          {
            objc_msgSend(v33, "modelKind");
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            v38 = (objc_class *)objc_msgSend(v37, "modelClass");

            if (v38 != (objc_class *)objc_opt_class()
              && v38 != (objc_class *)objc_opt_class()
              && -[objc_class isSubclassOfClass:](v38, "isSubclassOfClass:", objc_opt_class()))
            {
              v39 = (void *)objc_msgSend([v38 alloc], "initWithIdentifiers:", v33);
              objc_msgSend(MEMORY[0x24BDDC890], "genericObjectWithModelObject:", v39);
              v40 = objc_claimAutoreleasedReturnValue();
              if (!v40)
              {
                objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
                v41 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(*(id *)(v6 + 1992), "stringWithUTF8String:", "MPModelGenericObject *_MPCSPIRDecodeGenericObject(__unsafe_unretained Class, MPIdentifierSet *__strong)");
                v42 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v41, "handleFailureInFunction:file:lineNumber:description:", v42, CFSTR("MPCModelStorePlaybackItemsRequest.m"), 151, CFSTR("Failed to create generic object from identifers.modelKind | potentialModelClass=MPModelGenericObject identifierSet=%@"), v33);
LABEL_58:

                v46 = 0;
                goto LABEL_27;
              }
              goto LABEL_26;
            }
          }
          objc_msgSend(*(id *)(v26 + 1880), "emptyIdentifierSet");
          v34 = (id)objc_claimAutoreleasedReturnValue();
          if (v33 == v34)
          {

          }
          else
          {
            v35 = v34;
            v36 = objc_msgSend(v33, "isEqual:", v34);

            if (!v36)
            {
LABEL_25:
              v39 = (void *)objc_msgSend(objc_alloc((Class)v30), "initWithIdentifiers:", v33);
              objc_msgSend(MEMORY[0x24BDDC890], "genericObjectWithModelObject:", v39);
              v40 = objc_claimAutoreleasedReturnValue();
              if (!v40)
              {
                objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
                v41 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(*(id *)(v6 + 1992), "stringWithUTF8String:", "MPModelGenericObject *_MPCSPIRDecodeGenericObject(__unsafe_unretained Class, MPIdentifierSet *__strong)");
                v42 = (void *)objc_claimAutoreleasedReturnValue();
                v70 = v33;
                objc_msgSend(v41, "handleFailureInFunction:file:lineNumber:description:", v42, CFSTR("MPCModelStorePlaybackItemsRequest.m"), 165, CFSTR("Failed to create generic object from potentialModelClass | potentialModelClass=%@ identifierSet=%@"), v30);
                goto LABEL_58;
              }
LABEL_26:
              v46 = (void *)v40;
LABEL_27:

              v75 = v46;
              objc_msgSend(v78, "appendSection:", v46);
              v47 = objc_msgSend(v32, "count");
              if (v47 >= 2)
              {
                v48 = 0;
                v49 = v47 - 1;
                while (2)
                {
                  objc_msgSend(v32, "objectAtIndex:", v48);
                  v50 = (NSString *)objc_claimAutoreleasedReturnValue();
                  if (_NSIsNSString())
                    v51 = NSClassFromString(v50);
                  else
                    v51 = 0;
                  if (!objc_msgSend(v51, "isSubclassOfClass:", objc_opt_class()))
                    goto LABEL_49;
                  objc_msgSend(v32, "objectAtIndex:", v48 + 1);
                  v52 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_opt_class();
                  if ((objc_opt_isKindOfClass() & 1) != 0)
                  {
                    v53 = v52;
                    if ((void *)objc_opt_class() == v51)
                    {
                      objc_msgSend(v53, "modelKind");
                      v57 = (void *)objc_claimAutoreleasedReturnValue();
                      v58 = (objc_class *)objc_msgSend(v57, "modelClass");

                      v26 = 0x24BDDC000;
                      if (v58 != (objc_class *)objc_opt_class()
                        && v58 != (objc_class *)objc_opt_class()
                        && -[objc_class isSubclassOfClass:](v58, "isSubclassOfClass:", objc_opt_class()))
                      {
                        v59 = (void *)objc_msgSend([v58 alloc], "initWithIdentifiers:", v53);
                        objc_msgSend(MEMORY[0x24BDDC890], "genericObjectWithModelObject:", v59);
                        v60 = objc_claimAutoreleasedReturnValue();
                        if (!v60)
                        {
                          objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
                          v61 = (void *)objc_claimAutoreleasedReturnValue();
                          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "MPModelGenericObject *_MPCSPIRDecodeGenericObject(__unsafe_unretained Class, MPIdentifierSet *__strong)");
                          v62 = (void *)objc_claimAutoreleasedReturnValue();
                          objc_msgSend(v61, "handleFailureInFunction:file:lineNumber:description:", v62, CFSTR("MPCModelStorePlaybackItemsRequest.m"), 151, CFSTR("Failed to create generic object from identifers.modelKind | potentialModelClass=MPModelGenericObject identifierSet=%@"), v53, v70);
                          goto LABEL_52;
                        }
LABEL_46:
                        v66 = (void *)v60;
                        goto LABEL_47;
                      }
                    }
                    objc_msgSend(*(id *)(v26 + 1880), "emptyIdentifierSet");
                    v54 = (id)objc_claimAutoreleasedReturnValue();
                    if (v53 == v54)
                    {

                    }
                    else
                    {
                      v55 = v54;
                      v56 = objc_msgSend(v53, "isEqual:", v54);

                      if (!v56)
                        goto LABEL_45;
                    }
                    v51 = (void *)objc_opt_class();
                    v63 = objc_alloc(MEMORY[0x24BDDC758]);
                    objc_msgSend(MEMORY[0x24BDDC8B0], "identityKind");
                    v64 = (void *)objc_claimAutoreleasedReturnValue();
                    v65 = objc_msgSend(v63, "initWithSource:modelKind:block:", CFSTR("StorePlaybackItemsRequest-DecodedEmpty"), v64, &__block_literal_global_261_7972);

                    v53 = (id)v65;
LABEL_45:
                    v59 = (void *)objc_msgSend(objc_alloc((Class)v51), "initWithIdentifiers:", v53);
                    objc_msgSend(MEMORY[0x24BDDC890], "genericObjectWithModelObject:", v59);
                    v60 = objc_claimAutoreleasedReturnValue();
                    if (v60)
                      goto LABEL_46;
                    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
                    v61 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "MPModelGenericObject *_MPCSPIRDecodeGenericObject(__unsafe_unretained Class, MPIdentifierSet *__strong)");
                    v69 = v51;
                    v62 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v61, "handleFailureInFunction:file:lineNumber:description:", v62, CFSTR("MPCModelStorePlaybackItemsRequest.m"), 165, CFSTR("Failed to create generic object from potentialModelClass | potentialModelClass=%@ identifierSet=%@"), v69, v53);
LABEL_52:

                    v66 = 0;
LABEL_47:

                    objc_msgSend(v78, "appendItem:", v66);
                    v26 = 0x24BDDC000;
                  }

LABEL_49:
                  v48 += 2;
                  if (v48 >= v49)
                    break;
                  continue;
                }
              }

              v6 = 0x24BDD1000;
              v28 = v73;
              v24 = v74;
              v31 = v76;
              v29 = v77;
              goto LABEL_54;
            }
          }
          v30 = (void *)objc_opt_class();
          v43 = objc_alloc(*(Class *)(v26 + 1880));
          objc_msgSend(MEMORY[0x24BDDC8B0], "identityKind");
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          v45 = objc_msgSend(v43, "initWithSource:modelKind:block:", CFSTR("StorePlaybackItemsRequest-DecodedEmpty"), v44, &__block_literal_global_261_7972);

          v33 = (id)v45;
          goto LABEL_25;
        }
LABEL_59:
        v5 = v71;
        sectionedModelObjects = v71->_sectionedModelObjects;
        v71->_sectionedModelObjects = (MPSectionedCollection *)v78;

        v4 = v72;
        v71->_shouldBatchResultsWithPlaceholderObjects = objc_msgSend(v72, "decodeBoolForKey:", CFSTR("MPCModelStorePlaybackItemsRequestShouldBatchResultsWithPlaceholderObjects"));
      }

    }
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  MPSectionedCollection *sectionedModelObjects;
  id v7;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(uint64_t, void *, uint64_t);
  void *v11;
  id v12;
  MPCModelStorePlaybackItemsRequest *v13;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)MPCModelStorePlaybackItemsRequest;
  -[MPCModelStorePlaybackItemsRequest encodeWithCoder:](&v14, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeBool:forKey:", self->_allowLocalEquivalencies, CFSTR("MPCModelStorePlaybackItemsRequestAllowLocalEquivalencies"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_clientIdentifier, CFSTR("MPCModelStorePlaybackItemsRequestClientIdentifier"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_playbackRequestEnvironment, CFSTR("MPCModelStorePlaybackItemsRequestPlaybackRequestEnvironment"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_storeIDs, CFSTR("MPCModelStorePlaybackItemsRequestStoreIDs"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_storeIDsAnonymousGroupUUID, CFSTR("_MPCModelStorePlaybackItemsRequestCodingKeyStoreIDsUUID"));
  objc_msgSend(v4, "encodeBool:forKey:", self->_shouldBatchResultsWithPlaceholderObjects, CFSTR("MPCModelStorePlaybackItemsRequestShouldBatchResultsWithPlaceholderObjects"));
  objc_msgSend(v4, "encodeBool:forKey:", self->_inGroupSession, CFSTR("_MPCModelStorePlaybackItemsRequestCodingKeyInGroupSession"));
  if (self->_sectionedModelObjects)
  {
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", 3 * -[MPSectionedCollection numberOfSections](self->_sectionedModelObjects, "numberOfSections"));
    sectionedModelObjects = self->_sectionedModelObjects;
    v8 = MEMORY[0x24BDAC760];
    v9 = 3221225472;
    v10 = __53__MPCModelStorePlaybackItemsRequest_encodeWithCoder___block_invoke;
    v11 = &unk_24CAB4078;
    v12 = v5;
    v13 = self;
    v7 = v5;
    -[MPSectionedCollection enumerateSectionsUsingBlock:](sectionedModelObjects, "enumerateSectionsUsingBlock:", &v8);
    objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("MPCModelStorePlaybackItemsRequestSectionedModelObjects"), v8, v9, v10, v11);

  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id *v4;
  id *v5;
  uint64_t v6;
  id v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)MPCModelStorePlaybackItemsRequest;
  v4 = -[MPCModelStorePlaybackItemsRequest copyWithZone:](&v9, sel_copyWithZone_, a3);
  v5 = v4;
  if (v4)
  {
    *((_BYTE *)v4 + 73) = self->_allowLocalEquivalencies;
    objc_storeStrong(v4 + 13, self->_clientIdentifier);
    objc_storeStrong(v5 + 10, self->_playbackRequestEnvironment);
    objc_storeStrong(v5 + 12, self->_previousResponse);
    objc_storeStrong(v5 + 14, self->_sectionedModelObjects);
    objc_storeStrong(v5 + 11, self->_storeIDs);
    objc_storeStrong(v5 + 8, self->_storeIDsAnonymousGroupUUID);
    v6 = -[NSArray copy](self->_playbackPrioritizedIndexPaths, "copy");
    v7 = v5[16];
    v5[16] = (id)v6;

    *((_BYTE *)v5 + 72) = self->_shouldBatchResultsWithPlaceholderObjects;
    objc_storeStrong(v5 + 15, self->_trustProvider);
    *((_BYTE *)v5 + 75) = self->_useUniversalAccumulator;
    objc_storeStrong(v5 + 17, self->_abc_siriAssetInfo);
    objc_storeStrong(v5 + 18, self->_abc_preferredShuffleStartIdentifiers);
    *((_BYTE *)v5 + 74) = self->_inGroupSession;
  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  int allowLocalEquivalencies;
  MPSectionedCollection *sectionedModelObjects;
  MPSectionedCollection *v7;
  MPSectionedCollection *v8;
  int v9;
  NSArray *storeIDs;
  NSArray *v11;
  NSArray *v12;
  int v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  char v18;
  BOOL v19;
  int inGroupSession;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_13;
  allowLocalEquivalencies = self->_allowLocalEquivalencies;
  if (allowLocalEquivalencies == objc_msgSend(v4, "allowLocalEquivalencies"))
    goto LABEL_13;
  sectionedModelObjects = self->_sectionedModelObjects;
  objc_msgSend(v4, "sectionedModelObjects");
  v7 = (MPSectionedCollection *)(id)objc_claimAutoreleasedReturnValue();
  if (sectionedModelObjects == v7)
  {

  }
  else
  {
    v8 = v7;
    v9 = -[MPSectionedCollection isEqual:](sectionedModelObjects, "isEqual:", v7);

    if (!v9)
      goto LABEL_13;
  }
  storeIDs = self->_storeIDs;
  objc_msgSend(v4, "storeIDs");
  v11 = (NSArray *)(id)objc_claimAutoreleasedReturnValue();
  if (storeIDs == v11)
  {

  }
  else
  {
    v12 = v11;
    v13 = -[NSArray isEqual:](storeIDs, "isEqual:", v11);

    if (!v13)
      goto LABEL_13;
  }
  -[MPCPlaybackRequestEnvironment userIdentity](self->_playbackRequestEnvironment, "userIdentity");
  v14 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "playbackRequestEnvironment");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "userIdentity");
  v16 = (id)objc_claimAutoreleasedReturnValue();
  if (v14 == v16)
  {

    goto LABEL_16;
  }
  v17 = v16;
  v18 = objc_msgSend(v14, "isEqual:", v16);

  if ((v18 & 1) != 0)
  {
LABEL_16:
    inGroupSession = self->_inGroupSession;
    v19 = inGroupSession == objc_msgSend(v4, "isInGroupSession");
    goto LABEL_14;
  }
LABEL_13:
  v19 = 0;
LABEL_14:

  return v19;
}

- (void)setStoreIDs:(id)a3
{
  void *v4;
  id v5;
  NSUUID *v6;
  NSUUID *storeIDsAnonymousGroupUUID;
  NSArray *v8;
  NSArray *storeIDs;

  v4 = (void *)MEMORY[0x24BDD1880];
  v5 = a3;
  objc_msgSend(v4, "UUID");
  v6 = (NSUUID *)objc_claimAutoreleasedReturnValue();
  storeIDsAnonymousGroupUUID = self->_storeIDsAnonymousGroupUUID;
  self->_storeIDsAnonymousGroupUUID = v6;

  v8 = (NSArray *)objc_msgSend(v5, "copy");
  storeIDs = self->_storeIDs;
  self->_storeIDs = v8;

}

- (BOOL)isValid
{
  return -[NSArray count](self->_storeIDs, "count")
      || -[MPSectionedCollection numberOfSections](self->_sectionedModelObjects, "numberOfSections")
      || -[MPSectionedCollection totalItemCount](self->_sectionedModelObjects, "totalItemCount") != 0;
}

- (void)setIdentifiers:(id)a3
{
  id v5;
  id v6;
  id v7;
  MPSectionedCollection *sectionedModelObjects;
  id v9;
  NSArray *storeIDs;
  id v11;
  _QWORD v12[5];
  id v13;
  id v14;
  SEL v15;

  v5 = a3;
  v6 = objc_alloc_init(MEMORY[0x24BDDCA88]);
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __52__MPCModelStorePlaybackItemsRequest_setIdentifiers___block_invoke;
  v12[3] = &unk_24CAB40C8;
  v15 = a2;
  v12[4] = self;
  v7 = v6;
  v13 = v7;
  v14 = v5;
  v11 = v5;
  objc_msgSend(v11, "enumerateSectionsUsingBlock:", v12);
  sectionedModelObjects = self->_sectionedModelObjects;
  self->_sectionedModelObjects = (MPSectionedCollection *)v7;
  v9 = v7;

  storeIDs = self->_storeIDs;
  self->_storeIDs = 0;

}

- (MPSectionedCollection)identifiers
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  NSArray *storeIDs;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  MPSectionedCollection *sectionedModelObjects;
  _QWORD v26[4];
  id v27;
  _QWORD v28[4];
  id v29;
  _QWORD v30[4];
  id v31;
  _QWORD v32[5];
  id v33;
  _QWORD v34[5];
  _QWORD v35[7];

  v35[5] = *MEMORY[0x24BDAC8D0];
  -[MPCModelStorePlaybackItemsRequest playbackRequestEnvironment](self, "playbackRequestEnvironment");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "userIdentity");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "accountDSID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (self->_storeIDs)
  {
    v6 = objc_alloc_init(MEMORY[0x24BDDCA88]);
    v7 = objc_alloc(MEMORY[0x24BDDC758]);
    objc_msgSend(MEMORY[0x24BDDC8B0], "identityKind");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = MEMORY[0x24BDAC760];
    v32[0] = MEMORY[0x24BDAC760];
    v32[1] = 3221225472;
    v32[2] = __48__MPCModelStorePlaybackItemsRequest_identifiers__block_invoke;
    v32[3] = &unk_24CAB4110;
    v32[4] = self;
    v10 = v5;
    v33 = v10;
    v11 = (void *)objc_msgSend(v7, "initWithSource:modelKind:block:", CFSTR("StorePlaybackItemsRequest"), v8, v32);
    objc_msgSend(v6, "appendSection:", v11);

    storeIDs = self->_storeIDs;
    v30[0] = v9;
    v30[1] = 3221225472;
    v30[2] = __48__MPCModelStorePlaybackItemsRequest_identifiers__block_invoke_3;
    v30[3] = &unk_24CAB4158;
    v31 = v10;
    -[NSArray msv_map:](storeIDs, "msv_map:", v30);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "appendItems:", v13);

    v14 = objc_alloc(MEMORY[0x24BDDCB30]);
    v34[0] = *MEMORY[0x24BDDC278];
    objc_msgSend(MEMORY[0x24BDDCB30], "emptyPropertySet");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v35[0] = v15;
    v34[1] = *MEMORY[0x24BDDC2B8];
    objc_msgSend(MEMORY[0x24BDDCB30], "emptyPropertySet");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v35[1] = v16;
    v34[2] = *MEMORY[0x24BDDC2F8];
    objc_msgSend(MEMORY[0x24BDDCB30], "emptyPropertySet");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v35[2] = v17;
    v34[3] = *MEMORY[0x24BDDC2B0];
    objc_msgSend(MEMORY[0x24BDDCB30], "emptyPropertySet");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v35[3] = v18;
    v34[4] = *MEMORY[0x24BDDC300];
    objc_msgSend(MEMORY[0x24BDDCB30], "emptyPropertySet");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v35[4] = v19;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v35, v34, 5);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = (void *)objc_msgSend(v14, "initWithProperties:relationships:", MEMORY[0x24BDBD1A8], v20);

    v28[0] = v9;
    v28[1] = 3221225472;
    v28[2] = __48__MPCModelStorePlaybackItemsRequest_identifiers__block_invoke_6;
    v28[3] = &unk_24CAB4180;
    v29 = v21;
    v26[0] = v9;
    v26[1] = 3221225472;
    v26[2] = __48__MPCModelStorePlaybackItemsRequest_identifiers__block_invoke_7;
    v26[3] = &unk_24CAB41A8;
    v27 = v29;
    v22 = v29;
    objc_msgSend(v6, "lazyMapWithSections:items:", v28, v26);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    sectionedModelObjects = self->_sectionedModelObjects;
    if (sectionedModelObjects)
    {
      -[MPSectionedCollection lazyMapWithSections:items:](sectionedModelObjects, "lazyMapWithSections:items:", &__block_literal_global_103, &__block_literal_global_105);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v23 = 0;
    }
  }

  return (MPSectionedCollection *)v23;
}

- (MPCPlaybackRequestEnvironment)playbackRequestEnvironment
{
  return self->_playbackRequestEnvironment;
}

- (void)setPlaybackRequestEnvironment:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (NSArray)storeIDs
{
  return self->_storeIDs;
}

- (MPModelResponse)previousResponse
{
  return self->_previousResponse;
}

- (void)setPreviousResponse:(id)a3
{
  objc_storeStrong((id *)&self->_previousResponse, a3);
}

- (BOOL)shouldBatchResultsWithPlaceholderObjects
{
  return self->_shouldBatchResultsWithPlaceholderObjects;
}

- (void)setShouldBatchResultsWithPlaceholderObjects:(BOOL)a3
{
  self->_shouldBatchResultsWithPlaceholderObjects = a3;
}

- (BOOL)allowLocalEquivalencies
{
  return self->_allowLocalEquivalencies;
}

- (void)setAllowLocalEquivalencies:(BOOL)a3
{
  self->_allowLocalEquivalencies = a3;
}

- (void)setClientIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (MPSectionedCollection)sectionedModelObjects
{
  return self->_sectionedModelObjects;
}

- (void)setSectionedModelObjects:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (MPServerObjectDatabasePlaybackAuthorizationTokenTrustProvider)trustProvider
{
  return self->_trustProvider;
}

- (void)setTrustProvider:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 120);
}

- (BOOL)isInGroupSession
{
  return self->_inGroupSession;
}

- (void)setInGroupSession:(BOOL)a3
{
  self->_inGroupSession = a3;
}

- (BOOL)useUniversalAccumulator
{
  return self->_useUniversalAccumulator;
}

- (void)setUseUniversalAccumulator:(BOOL)a3
{
  self->_useUniversalAccumulator = a3;
}

- (NSArray)playbackPrioritizedIndexPaths
{
  return self->_playbackPrioritizedIndexPaths;
}

- (void)setPlaybackPrioritizedIndexPaths:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 128);
}

- (NSString)abc_siriAssetInfo
{
  return self->_abc_siriAssetInfo;
}

- (void)setAbc_siriAssetInfo:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 136);
}

- (MPIdentifierSet)abc_preferredShuffleStartIdentifiers
{
  return self->_abc_preferredShuffleStartIdentifiers;
}

- (void)setAbc_preferredShuffleStartIdentifiers:(id)a3
{
  objc_storeStrong((id *)&self->_abc_preferredShuffleStartIdentifiers, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_abc_preferredShuffleStartIdentifiers, 0);
  objc_storeStrong((id *)&self->_abc_siriAssetInfo, 0);
  objc_storeStrong((id *)&self->_playbackPrioritizedIndexPaths, 0);
  objc_storeStrong((id *)&self->_trustProvider, 0);
  objc_storeStrong((id *)&self->_sectionedModelObjects, 0);
  objc_storeStrong((id *)&self->_clientIdentifier, 0);
  objc_storeStrong((id *)&self->_previousResponse, 0);
  objc_storeStrong((id *)&self->_storeIDs, 0);
  objc_storeStrong((id *)&self->_playbackRequestEnvironment, 0);
  objc_storeStrong((id *)&self->_storeIDsAnonymousGroupUUID, 0);
}

void __48__MPCModelStorePlaybackItemsRequest_identifiers__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v4 = a2;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "UUIDString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setOpaqueID:", v3);

  if (objc_msgSend(*(id *)(a1 + 40), "length"))
    objc_msgSend(v4, "setPersonalStoreIdentifiersWithPersonID:block:", *(_QWORD *)(a1 + 40), &__block_literal_global_7925);

}

id __48__MPCModelStorePlaybackItemsRequest_identifiers__block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;
  id v11;

  v3 = a2;
  v4 = objc_alloc(MEMORY[0x24BDDC758]);
  objc_msgSend(MEMORY[0x24BDDC8C0], "unknownKind");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __48__MPCModelStorePlaybackItemsRequest_identifiers__block_invoke_4;
  v9[3] = &unk_24CAB4110;
  v10 = v3;
  v11 = *(id *)(a1 + 32);
  v6 = v3;
  v7 = (void *)objc_msgSend(v4, "initWithSource:modelKind:block:", CFSTR("StorePlaybackItemsRequest"), v5, v9);

  return v7;
}

id __48__MPCModelStorePlaybackItemsRequest_identifiers__block_invoke_6(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v3 = (void *)MEMORY[0x24BDDCBC8];
  v4 = a2;
  objc_msgSend(v3, "sharedServerObjectDatabase");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "identifiersMatchingIdentifierSet:propertySet:options:", v4, *(_QWORD *)(a1 + 32), 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
    v7 = v6;
  else
    v7 = v4;
  v8 = v7;

  return v8;
}

id __48__MPCModelStorePlaybackItemsRequest_identifiers__block_invoke_7(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v3 = (void *)MEMORY[0x24BDDCBC8];
  v4 = a2;
  objc_msgSend(v3, "sharedServerObjectDatabase");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "identifiersMatchingIdentifierSet:propertySet:options:", v4, *(_QWORD *)(a1 + 32), 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
    v7 = v6;
  else
    v7 = v4;
  v8 = v7;

  return v8;
}

uint64_t __48__MPCModelStorePlaybackItemsRequest_identifiers__block_invoke_9(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "identifiers");
}

uint64_t __48__MPCModelStorePlaybackItemsRequest_identifiers__block_invoke_8(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "identifiers");
}

void __48__MPCModelStorePlaybackItemsRequest_identifiers__block_invoke_4(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  objc_msgSend(v3, "setOpaqueID:", *(_QWORD *)(a1 + 32));
  if (objc_msgSend(*(id *)(a1 + 40), "length"))
    objc_msgSend(v3, "setPersonalStoreIdentifiersWithPersonID:block:", *(_QWORD *)(a1 + 40), &__block_literal_global_96);

}

void __52__MPCModelStorePlaybackItemsRequest_setIdentifiers___block_invoke(_QWORD *a1, void *a2, uint64_t a3)
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  _QWORD v17[5];
  id v18;
  uint64_t v19;

  v16 = a2;
  objc_msgSend(v16, "modelKind");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "modelClass");

  if (!v6)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a1[7], a1[4], CFSTR("MPCModelStorePlaybackItemsRequest.m"), 308, CFSTR("Invalid section identifiers [missing section model class] for identifiers: %@"), v16);

  }
  if ((objc_msgSend(v6, "isSubclassOfClass:", objc_opt_class()) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a1[7], a1[4], CFSTR("MPCModelStorePlaybackItemsRequest.m"), 309, CFSTR("Invalid section identifiers [modelKind.modelClass is not a subclass of MPModelObject] for identifiers: %@"), v16);

  }
  if (v6 == (void *)objc_opt_class())
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a1[7], a1[4], CFSTR("MPCModelStorePlaybackItemsRequest.m"), 310, CFSTR("Invalid section identifiers [modelKind.modelClass cannot be the abstract type MPModelObject] for identifiers: %@"), v16);

  }
  v7 = (void *)objc_msgSend(objc_alloc((Class)v6), "initWithIdentifiers:", v16);
  v8 = (void *)a1[5];
  objc_msgSend(MEMORY[0x24BDDC890], "genericObjectWithModelObject:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "appendSection:", v9);

  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __52__MPCModelStorePlaybackItemsRequest_setIdentifiers___block_invoke_2;
  v17[3] = &unk_24CAB40A0;
  v10 = (void *)a1[6];
  v11 = a1[4];
  v12 = (void *)a1[5];
  v19 = a1[7];
  v17[4] = v11;
  v18 = v12;
  objc_msgSend(v10, "enumerateItemsInSectionAtIndex:usingBlock:", a3, v17);

}

void __52__MPCModelStorePlaybackItemsRequest_setIdentifiers___block_invoke_2(_QWORD *a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a2;
  objc_msgSend(v11, "modelKind");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "modelClass");

  if (!v4)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a1[6], a1[4], CFSTR("MPCModelStorePlaybackItemsRequest.m"), 316, CFSTR("Invalid item identifiers [missing item model class] for identifiers: %@"), v11);

  }
  if ((objc_msgSend(v4, "isSubclassOfClass:", objc_opt_class()) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a1[6], a1[4], CFSTR("MPCModelStorePlaybackItemsRequest.m"), 317, CFSTR("Invalid item identifiers [modelKind.modelClass is not a subclass of MPModelObject] for identifiers: %@"), v11);

  }
  if (v4 == (void *)objc_opt_class())
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a1[6], a1[4], CFSTR("MPCModelStorePlaybackItemsRequest.m"), 318, CFSTR("Invalid item identifiers [modelKind.modelClass cannot be the abstract type MPModelObject] for identifiers: %@"), v11);

  }
  v5 = (void *)objc_msgSend(objc_alloc((Class)v4), "initWithIdentifiers:", v11);
  v6 = (void *)a1[5];
  objc_msgSend(MEMORY[0x24BDDC890], "genericObjectWithModelObject:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "appendItem:", v7);

}

void __53__MPCModelStorePlaybackItemsRequest_encodeWithCoder___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  id v6;
  objc_class *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  _QWORD v14[4];
  id v15;

  v5 = *(void **)(a1 + 32);
  v6 = a2;
  v7 = (objc_class *)objc_opt_class();
  NSStringFromClass(v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v8);

  v9 = *(void **)(a1 + 32);
  objc_msgSend(v6, "identifiers");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "addObject:", v10);
  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", 2 * objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 112), "numberOfItemsInSection:", a3));
  v12 = *(void **)(*(_QWORD *)(a1 + 40) + 112);
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __53__MPCModelStorePlaybackItemsRequest_encodeWithCoder___block_invoke_2;
  v14[3] = &unk_24CAB4050;
  v15 = v11;
  v13 = v11;
  objc_msgSend(v12, "enumerateItemsInSectionAtIndex:usingBlock:", a3, v14);
  objc_msgSend(*(id *)(a1 + 32), "addObject:", v13);

}

void __53__MPCModelStorePlaybackItemsRequest_encodeWithCoder___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  objc_class *v5;
  void *v6;
  void *v7;
  id v8;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v6);

  v7 = *(void **)(a1 + 32);
  objc_msgSend(v4, "identifiers");
  v8 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "addObject:", v8);
}

void __48__MPCModelStorePlaybackItemsRequest_description__block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD v17[4];
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;

  v7 = *(void **)(*(_QWORD *)(a1 + 32) + 112);
  v8 = a2;
  v9 = objc_msgSend(v7, "numberOfItemsInSection:", a3);
  v10 = *(void **)(a1 + 40);
  objc_msgSend(v8, "humanDescription");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "appendFormat:", CFSTR("  %2ld <%ld items> %@: [\n"), a3, v9, v11);
  v12 = *(void **)(a1 + 40);
  v13 = *(void **)(*(_QWORD *)(a1 + 32) + 112);
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __48__MPCModelStorePlaybackItemsRequest_description__block_invoke_2;
  v17[3] = &unk_24CAB4000;
  v14 = v12;
  v15 = *(_QWORD *)(a1 + 48);
  v18 = v14;
  v19 = v15;
  v20 = a3;
  v21 = v9;
  objc_msgSend(v13, "enumerateItemsInSectionAtIndex:usingBlock:", a3, v17);
  objc_msgSend(*(id *)(a1 + 40), "appendString:", CFSTR("]\n"));
  if (*(uint64_t *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) >= 51)
  {
    *a4 = 1;
    v16 = *(_QWORD *)(a1 + 56);
    if (a3 + 1 != v16)
      objc_msgSend(*(id *)(a1 + 40), "appendFormat:", CFSTR("  ... (%ld remaining sections)\n"), v16 - a3);
  }

}

void __48__MPCModelStorePlaybackItemsRequest_description__block_invoke_2(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v7;
  uint64_t v8;
  void *v9;

  v7 = *(void **)(a1 + 32);
  v8 = *(_QWORD *)(a1 + 48);
  objc_msgSend(a2, "humanDescription");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "appendFormat:", CFSTR("  %2ld,%2ld %@\n"), v8, a3, v9);

  if ((uint64_t)++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) >= 51)
  {
    *a4 = 1;
    objc_msgSend(*(id *)(a1 + 32), "appendFormat:", CFSTR("    ... (%ld remaining items)\n"), *(_QWORD *)(a1 + 56) - a3);
  }
}

+ (BOOL)requiresNetwork
{
  return 1;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (void)MPC_consumeSiriAssetInfo:(id)a3 playActivityFeatureName:(id)a4 userIdentity:(id)a5 completion:(id)a6
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  id v12;
  uint64_t v13;
  id v14;
  void *v15;
  void *v16;
  _QWORD v17[4];
  id v18;
  id v19;
  id v20;
  _QWORD v21[4];
  id v22;
  uint8_t buf[16];

  v8 = a3;
  v9 = a5;
  v10 = a6;
  if (objc_msgSend(v8, "length"))
  {
    v11 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_210BD8000, v11, OS_LOG_TYPE_DEFAULT, "[MPCModelStorePlaybackItemsRequest] Siri asset info present, starting URL bag load...", buf, 2u);
    }

    v12 = objc_alloc(MEMORY[0x24BEC89F8]);
    v13 = MEMORY[0x24BDAC760];
    v21[0] = MEMORY[0x24BDAC760];
    v21[1] = 3221225472;
    v21[2] = __136__MPCModelStorePlaybackItemsRequest_MPCSiriPlaybackAdditions__MPC_consumeSiriAssetInfo_playActivityFeatureName_userIdentity_completion___block_invoke;
    v21[3] = &unk_24CAB75A8;
    v14 = v9;
    v22 = v14;
    v15 = (void *)objc_msgSend(v12, "initWithBlock:", v21);
    objc_msgSend(MEMORY[0x24BEC8A38], "sharedBagProvider");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = v13;
    v17[1] = 3221225472;
    v17[2] = __136__MPCModelStorePlaybackItemsRequest_MPCSiriPlaybackAdditions__MPC_consumeSiriAssetInfo_playActivityFeatureName_userIdentity_completion___block_invoke_2;
    v17[3] = &unk_24CAB75F8;
    v20 = v10;
    v18 = v8;
    v19 = v14;
    objc_msgSend(v16, "getBagForRequestContext:withCompletionHandler:", v15, v17);

  }
  else if (v10)
  {
    (*((void (**)(id, _QWORD))v10 + 2))(v10, 0);
  }

}

void __136__MPCModelStorePlaybackItemsRequest_MPCSiriPlaybackAdditions__MPC_consumeSiriAssetInfo_playActivityFeatureName_userIdentity_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  id v3;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = a2;
  objc_msgSend(v3, "setIdentity:", v2);
  objc_msgSend(v3, "setAllowsExpiredBags:", 1);

}

void __136__MPCModelStorePlaybackItemsRequest_MPCSiriPlaybackAdditions__MPC_consumeSiriAssetInfo_playActivityFeatureName_userIdentity_completion___block_invoke_2(id *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  id v8;
  void (**v9)(void);
  _QWORD block[4];
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;

  v5 = a2;
  v6 = a3;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __136__MPCModelStorePlaybackItemsRequest_MPCSiriPlaybackAdditions__MPC_consumeSiriAssetInfo_playActivityFeatureName_userIdentity_completion___block_invoke_3;
  block[3] = &unk_24CAB75D0;
  v11 = v5;
  v12 = v6;
  v15 = a1[6];
  v13 = a1[4];
  v14 = a1[5];
  v7 = v6;
  v8 = v5;
  v9 = (void (**)(void))dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, QOS_CLASS_USER_INITIATED, 0, block);
  v9[2]();

}

void __136__MPCModelStorePlaybackItemsRequest_MPCSiriPlaybackAdditions__MPC_consumeSiriAssetInfo_playActivityFeatureName_userIdentity_completion___block_invoke_3(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  _BOOL4 v4;
  void (**v5)(dispatch_block_t, uint64_t, uint64_t, uint64_t);
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id v14;
  id v15;
  uint8_t buf[4];
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v2 = *(_QWORD *)(a1 + 32);
  v3 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
  v4 = os_log_type_enabled(v3, OS_LOG_TYPE_ERROR);
  if (v2)
  {
    if (v4)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_210BD8000, v3, OS_LOG_TYPE_ERROR, "[MPCModelStorePlaybackItemsRequest] Successfully loaded URL bag for Siri asset info, loading identity properties...", buf, 2u);
    }

    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __136__MPCModelStorePlaybackItemsRequest_MPCSiriPlaybackAdditions__MPC_consumeSiriAssetInfo_playActivityFeatureName_userIdentity_completion___block_invoke_7;
    v11[3] = &unk_24CAB7B40;
    v12 = *(id *)(a1 + 48);
    v15 = *(id *)(a1 + 64);
    v13 = *(id *)(a1 + 56);
    v14 = *(id *)(a1 + 32);
    v5 = (void (**)(dispatch_block_t, uint64_t, uint64_t, uint64_t))dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, QOS_CLASS_USER_INITIATED, 0, v11);
    v5[2](v5, v6, v7, v8);

  }
  else
  {
    if (v4)
    {
      v9 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 138543362;
      v17 = v9;
      _os_log_impl(&dword_210BD8000, v3, OS_LOG_TYPE_ERROR, "[MPCModelStorePlaybackItemsRequest] Failed to load URL bag for Siri asset info due to error: %{public}@", buf, 0xCu);
    }

    v10 = *(_QWORD *)(a1 + 64);
    if (v10)
      (*(void (**)(uint64_t, _QWORD))(v10 + 16))(v10, 0);
  }
}

void __136__MPCModelStorePlaybackItemsRequest_MPCSiriPlaybackAdditions__MPC_consumeSiriAssetInfo_playActivityFeatureName_userIdentity_completion___block_invoke_7(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  int v8;
  int v9;
  NSObject *v10;
  objc_class *v11;
  void *v12;
  NSObject *v13;
  uint64_t v14;
  NSObject *v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  id v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  NSObject *v31;
  uint64_t v32;
  os_log_t v33;
  objc_class *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  NSObject *v38;
  uint64_t v39;
  void *v40;
  NSObject *v41;
  const char *v42;
  NSObject *v43;
  uint32_t v44;
  void *v45;
  os_log_t v46;
  void *v47;
  uint64_t v48;
  void *v49;
  NSObject *v50;
  NSObject *v51;
  const char *v52;
  NSObject *v53;
  os_log_type_t v54;
  uint32_t v55;
  unint64_t v56;
  NSObject *v57;
  NSObject *v58;
  uint64_t v59;
  void *v60;
  NSObject *v61;
  id v62;
  void *v63;
  uint64_t v64;
  id v65;
  id *v66;
  uint64_t v67;
  uint64_t (*v68)(uint64_t, uint64_t);
  void (*v69)(uint64_t);
  id v70;
  uint64_t v71;
  uint64_t *v72;
  uint64_t v73;
  uint64_t v74;
  _QWORD v75[2];
  _QWORD v76[2];
  __int128 buf;
  void *v78;
  void *v79;
  id v80;
  id v81;
  id v82;
  uint64_t *v83;
  id *v84;
  uint64_t v85;

  v85 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x24BDD1608];
  objc_msgSend(*(id *)(a1 + 32), "dataUsingEncoding:", 4);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "JSONObjectWithData:options:error:", v3, 0, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if ((_NSIsNSDictionary() & 1) != 0)
  {
    objc_msgSend(v4, "valueForKeyPath:", CFSTR("meta.api"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v5)
    {
      objc_msgSend(v5, "valueForKeyPath:", CFSTR("format.resources"));
      v7 = objc_claimAutoreleasedReturnValue();
      if (_NSIsNSString()
        && (-[NSObject isEqualToString:](v7, "isEqualToString:", CFSTR("map")) & 1) != 0)
      {
        v8 = 0;
        v9 = 1;
        goto LABEL_16;
      }
      v13 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        LODWORD(buf) = 138543362;
        *(_QWORD *)((char *)&buf + 4) = v6;
        _os_log_impl(&dword_210BD8000, v13, OS_LOG_TYPE_ERROR, "[MPCModelStorePlaybackItemsRequest] Found metadata dictionary (%{public}@), but unexpected format", (uint8_t *)&buf, 0xCu);
      }

      v14 = *(_QWORD *)(a1 + 56);
      if (v14)
      {
        (*(void (**)(uint64_t, _QWORD))(v14 + 16))(v14, 0);
LABEL_83:

        goto LABEL_84;
      }
    }
    else
    {
      v7 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(buf) = 0;
        _os_log_impl(&dword_210BD8000, v7, OS_LOG_TYPE_DEFAULT, "[MPCModelStorePlaybackItemsRequest] Could not find metadata dictionary in the payload. Will default to store platform response", (uint8_t *)&buf, 2u);
      }
    }
    v9 = 0;
    v8 = 1;
LABEL_16:

    v15 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf) = 67109120;
      DWORD1(buf) = v9;
      _os_log_impl(&dword_210BD8000, v15, OS_LOG_TYPE_DEFAULT, "[MPCModelStorePlaybackItemsRequest] Siri asset info has payload type=%d.", (uint8_t *)&buf, 8u);
    }

    if (!v8)
    {
      v25 = (void *)MEMORY[0x24BDBCED8];
      v26 = v4;
      objc_msgSend(v25, "dictionary");
      v7 = objc_claimAutoreleasedReturnValue();
      v27 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDDCBD0]), "initWithPayload:", v26);

      objc_msgSend(MEMORY[0x24BDDCBC8], "sharedServerObjectDatabase");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v65 = 0;
      objc_msgSend(v28, "importObjectsFromRequest:options:error:", v27, 0, &v65);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = v65;

      if (!v29 || v30)
      {
        v31 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
        if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
        {
          LODWORD(buf) = 138543362;
          *(_QWORD *)((char *)&buf + 4) = v30;
          _os_log_impl(&dword_210BD8000, v31, OS_LOG_TYPE_ERROR, "Failed to import payload - error=%{public}@.", (uint8_t *)&buf, 0xCu);
        }
      }
      else
      {
        objc_msgSend(v29, "playableAssetIdentifiers");
        v31 = objc_claimAutoreleasedReturnValue();
        -[NSObject setObject:forKeyedSubscript:](v7, "setObject:forKeyedSubscript:", v31, CFSTR("MPCSiriPlaybackAdditionsMetadataOrderedPlayableAssetIdentifiersKey"));
      }

      -[NSObject objectForKeyedSubscript:](v7, "objectForKeyedSubscript:", CFSTR("MPCSiriPlaybackAdditionsMetadataOrderedPlayableAssetIdentifiersKey"));
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v37 = objc_msgSend(v36, "count");
      v38 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
      if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
      {
        LODWORD(buf) = 134217984;
        *(_QWORD *)((char *)&buf + 4) = v37;
        _os_log_impl(&dword_210BD8000, v38, OS_LOG_TYPE_DEFAULT, "Siri asset info contains %lu assets.", (uint8_t *)&buf, 0xCu);
      }

      if (v37 < 1)
      {
        v40 = 0;
      }
      else
      {
        if (v37 == 2)
        {
          objc_msgSend(v36, "lastObject");
          v39 = objc_claimAutoreleasedReturnValue();
        }
        else
        {
          if (v37 == 1)
            objc_msgSend(v36, "firstObject");
          else
            objc_msgSend(v36, "objectAtIndex:", arc4random() % (unint64_t)v37);
          v39 = objc_claimAutoreleasedReturnValue();
        }
        v40 = (void *)v39;
        if (v39)
        {
          v41 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
          if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
          {
            LODWORD(buf) = 138543362;
            *(_QWORD *)((char *)&buf + 4) = v40;
            _os_log_impl(&dword_210BD8000, v41, OS_LOG_TYPE_DEFAULT, "Siri asset info resulting in preferred shuffled starting with identifier=%{public}@", (uint8_t *)&buf, 0xCu);
          }

        }
      }

      goto LABEL_80;
    }
    v16 = *(void **)(a1 + 40);
    v17 = *(void **)(a1 + 48);
    v18 = v4;
    v19 = v16;
    v20 = v17;
    objc_msgSend(v18, "objectForKey:", CFSTR("results"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if ((_NSIsNSDictionary() & 1) != 0)
    {
      if (objc_msgSend(v21, "count"))
      {
        v71 = 0;
        v72 = &v71;
        v73 = 0x2020000000;
        v74 = 0;
        v66 = &v65;
        v67 = 0x3032000000;
        v68 = __Block_byref_object_copy__20890;
        v69 = __Block_byref_object_dispose__20891;
        v70 = 0;
        objc_msgSend(MEMORY[0x24BDBCE60], "dateWithTimeIntervalSinceNow:", 28800.0, 0);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        *(_QWORD *)&buf = MEMORY[0x24BDAC760];
        *((_QWORD *)&buf + 1) = 3221225472;
        v78 = ___MPCProcessSiriAssetInfoWithStorePlatformPayload_block_invoke;
        v79 = &unk_24CAB7660;
        v80 = v19;
        v81 = v20;
        v83 = &v71;
        v23 = v22;
        v82 = v23;
        v84 = &v65;
        objc_msgSend(v21, "enumerateKeysAndObjectsUsingBlock:", &buf);
        if (v66[5])
        {
          v75[0] = CFSTR("MPCSiriPlaybackAdditionsMetadataCountFromResponseKey");
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v72[3]);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          v75[1] = CFSTR("MPCSiriPlaybackAdditionsMetadataOrderedPlaybackCacheRequestsKey");
          v76[0] = v24;
          v76[1] = v66[5];
          objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v76, v75, 2);
        }
        else
        {
          v75[0] = CFSTR("MPCSiriPlaybackAdditionsMetadataCountFromResponseKey");
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v72[3]);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          v76[0] = v24;
          objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v76, v75, 1);
        }
        v45 = (void *)objc_claimAutoreleasedReturnValue();

        v33 = v45;
        _Block_object_dispose(&v65, 8);

        _Block_object_dispose(&v71, 8);
        v46 = v33;
LABEL_56:

        v7 = v46;
        -[NSObject objectForKeyedSubscript:](v7, "objectForKeyedSubscript:", CFSTR("MPCSiriPlaybackAdditionsMetadataCountFromResponseKey"));
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        v48 = objc_msgSend(v47, "unsignedIntegerValue");

        -[NSObject objectForKeyedSubscript:](v7, "objectForKeyedSubscript:", CFSTR("MPCSiriPlaybackAdditionsMetadataOrderedPlaybackCacheRequestsKey"));
        v49 = (void *)objc_claimAutoreleasedReturnValue();

        v50 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
        v51 = v50;
        if (v48)
        {
          if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
          {
            LODWORD(buf) = 134217984;
            *(_QWORD *)((char *)&buf + 4) = v48;
            v52 = "[MPCModelStorePlaybackItemsRequest] Siri asset info contains %lu metadata entities.";
            v53 = v51;
            v54 = OS_LOG_TYPE_DEFAULT;
            v55 = 12;
LABEL_61:
            _os_log_impl(&dword_210BD8000, v53, v54, v52, (uint8_t *)&buf, v55);
          }
        }
        else if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
        {
          LOWORD(buf) = 0;
          v52 = "[MPCModelStorePlaybackItemsRequest] Siri asset info contained no metadata.";
          v53 = v51;
          v54 = OS_LOG_TYPE_ERROR;
          v55 = 2;
          goto LABEL_61;
        }

        v56 = objc_msgSend(v49, "count");
        v57 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
        v58 = v57;
        if (v56)
        {
          if (os_log_type_enabled(v57, OS_LOG_TYPE_DEFAULT))
          {
            LODWORD(buf) = 134217984;
            *(_QWORD *)((char *)&buf + 4) = v56;
            _os_log_impl(&dword_210BD8000, v58, OS_LOG_TYPE_DEFAULT, "[MPCModelStorePlaybackItemsRequest] Siri asset info contains %lu assets.", (uint8_t *)&buf, 0xCu);
          }

          if (v56 == 2)
          {
            objc_msgSend(v49, "lastObject");
            v59 = objc_claimAutoreleasedReturnValue();
          }
          else
          {
            if (v56 == 1)
              objc_msgSend(v49, "firstObject");
            else
              objc_msgSend(v49, "objectAtIndex:", arc4random() % v56);
            v59 = objc_claimAutoreleasedReturnValue();
          }
          v60 = (void *)v59;
        }
        else
        {
          if (os_log_type_enabled(v57, OS_LOG_TYPE_ERROR))
          {
            LOWORD(buf) = 0;
            _os_log_impl(&dword_210BD8000, v58, OS_LOG_TYPE_ERROR, "[MPCModelStorePlaybackItemsRequest] Siri asset info contained no assets.", (uint8_t *)&buf, 2u);
          }

          v60 = 0;
        }
        v40 = (void *)objc_msgSend(v60, "storeSubscriptionAdamID");
        if (v40)
        {
          v61 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
          if (os_log_type_enabled(v61, OS_LOG_TYPE_DEFAULT))
          {
            LODWORD(buf) = 134217984;
            *(_QWORD *)((char *)&buf + 4) = v40;
            _os_log_impl(&dword_210BD8000, v61, OS_LOG_TYPE_DEFAULT, "[MPCModelStorePlaybackItemsRequest] Siri asset info resulting in preferred shuffled starting subscription adam ID %llu", (uint8_t *)&buf, 0xCu);
          }

          v62 = objc_alloc(MEMORY[0x24BDDC758]);
          objc_msgSend(MEMORY[0x24BDDC9E0], "identityKind");
          v63 = (void *)objc_claimAutoreleasedReturnValue();
          *(_QWORD *)&buf = MEMORY[0x24BDAC760];
          *((_QWORD *)&buf + 1) = 3221225472;
          v78 = ___MPCPreferredShuffleIdentifierSetFromStorePlatformPayload_block_invoke;
          v79 = &__block_descriptor_40_e49_v16__0__MPIdentifierSet_MPMutableIdentifierSet__8l;
          v80 = v40;
          v40 = (void *)objc_msgSend(v62, "initWithSource:modelKind:block:", CFSTR("MPCAssistant"), v63, &buf);

        }
LABEL_80:
        v64 = *(_QWORD *)(a1 + 56);
        if (v64)
          (*(void (**)(uint64_t, void *))(v64 + 16))(v64, v40);

        goto LABEL_83;
      }
      v33 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
      if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
      {
        LOWORD(buf) = 0;
        v42 = "Siri asset info has results dictionary key, but no objects inside.";
        v43 = v33;
        v44 = 2;
LABEL_54:
        _os_log_impl(&dword_210BD8000, v43, OS_LOG_TYPE_ERROR, v42, (uint8_t *)&buf, v44);
      }
    }
    else
    {
      v33 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
      if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
      {
        if (!v21)
        {
          LODWORD(buf) = 138543362;
          *(_QWORD *)((char *)&buf + 4) = 0;
          v42 = "Siri asset info expected to have results dictionary, found %{public}@ instead.";
          v43 = v33;
          v44 = 12;
          goto LABEL_54;
        }
        v34 = (objc_class *)objc_opt_class();
        NSStringFromClass(v34);
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(buf) = 138543362;
        *(_QWORD *)((char *)&buf + 4) = v35;
        _os_log_impl(&dword_210BD8000, v33, OS_LOG_TYPE_ERROR, "Siri asset info expected to have results dictionary, found %{public}@ instead.", (uint8_t *)&buf, 0xCu);

      }
    }
    v46 = 0;
    goto LABEL_56;
  }
  v10 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    if (v4)
    {
      v11 = (objc_class *)objc_opt_class();
      NSStringFromClass(v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(buf) = 138543362;
      *(_QWORD *)((char *)&buf + 4) = v12;
      _os_log_impl(&dword_210BD8000, v10, OS_LOG_TYPE_ERROR, "[MPCModelStorePlaybackItemsRequest] Siri asset info expected to be dictionary, was another type: %{public}@", (uint8_t *)&buf, 0xCu);

    }
    else
    {
      LODWORD(buf) = 138543362;
      *(_QWORD *)((char *)&buf + 4) = 0;
      _os_log_impl(&dword_210BD8000, v10, OS_LOG_TYPE_ERROR, "[MPCModelStorePlaybackItemsRequest] Siri asset info expected to be dictionary, was another type: %{public}@", (uint8_t *)&buf, 0xCu);
    }
  }

  v32 = *(_QWORD *)(a1 + 56);
  if (v32)
    (*(void (**)(uint64_t, _QWORD))(v32 + 16))(v32, 0);
LABEL_84:

}

@end
