@implementation GEOSessionUserActionMetadata

- (GEOSessionUserActionMetadata)init
{
  GEOSessionUserActionMetadata *v2;
  GEOPDSSessionUserActionMetadata *v3;
  GEOPDSSessionUserActionMetadata *actionMetadata;
  void *v5;
  _QWORD v7[4];
  GEOSessionUserActionMetadata *v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)GEOSessionUserActionMetadata;
  v2 = -[GEOSessionUserActionMetadata init](&v9, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(GEOPDSSessionUserActionMetadata);
    actionMetadata = v2->_actionMetadata;
    v2->_actionMetadata = v3;

    +[GEOUserSession sharedInstance](GEOUserSession, "sharedInstance");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __36__GEOSessionUserActionMetadata_init__block_invoke;
    v7[3] = &unk_1E1C04548;
    v8 = v2;
    objc_msgSend(v5, "shortSessionValues:", v7);

  }
  return v2;
}

uint64_t __36__GEOSessionUserActionMetadata_init__block_invoke(uint64_t result, double a2, double a3)
{
  *(double *)(*(_QWORD *)(result + 32) + 16) = a3;
  return result;
}

- (GEOPDSSessionUserActionMetadata)sessionUserActionMetadata
{
  void *v3;
  GEOPDSSessionUserActionMetadata *actionMetadata;
  GEOPDSSessionUserActionMetadata *v5;
  void *v6;
  _QWORD v8[6];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  char v12;

  v9 = 0;
  v10 = &v9;
  v11 = 0x2020000000;
  v12 = 0;
  +[GEOUserSession sharedInstance](GEOUserSession, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __57__GEOSessionUserActionMetadata_sessionUserActionMetadata__block_invoke;
  v8[3] = &unk_1E1C04570;
  v8[4] = self;
  v8[5] = &v9;
  objc_msgSend(v3, "shortSessionValues:", v8);

  actionMetadata = self->_actionMetadata;
  if (*((_BYTE *)v10 + 24))
  {
    v5 = actionMetadata;
  }
  else
  {
    -[GEOPDSSessionUserActionMetadata userActionMetadataElements](actionMetadata, "userActionMetadataElements");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "removeAllObjects");

    v5 = 0;
  }
  _Block_object_dispose(&v9, 8);
  return v5;
}

uint64_t __57__GEOSessionUserActionMetadata_sessionUserActionMetadata__block_invoke(uint64_t result, double a2, double a3)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(double *)(*(_QWORD *)(result + 32) + 16) == a3;
  return result;
}

- (void)captureSearchAction:(int)a3 searchTarget:(int)a4 maxCountToMaintain:(unint64_t)a5
{
  GEOPDSUserActionMetadataElement *v9;
  void *v10;
  GEOPDSUserActionMetadataElement *v11;

  v9 = objc_alloc_init(GEOPDSUserActionMetadataElement);
  if (v9)
  {
    *(_BYTE *)&v9->_flags |= 1u;
    v9->_uiAction = a3;
    *(_BYTE *)&v9->_flags |= 2u;
    v9->_uiTarget = a4;
  }
  v11 = v9;
  if (-[GEOPDSSessionUserActionMetadata userActionMetadataElementsCount](self->_actionMetadata, "userActionMetadataElementsCount") == a5)
  {
    -[GEOPDSSessionUserActionMetadata userActionMetadataElements](self->_actionMetadata, "userActionMetadataElements");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "removeObjectAtIndex:", 0);

  }
  -[GEOPDSSessionUserActionMetadata addUserActionMetadataElement:](self->_actionMetadata, "addUserActionMetadataElement:", v11);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sessionUserActionMetadata, 0);
  objc_storeStrong((id *)&self->_actionMetadata, 0);
}

@end
