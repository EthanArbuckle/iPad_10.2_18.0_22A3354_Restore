@implementation POPodcastRevision

- (id)deletedModelObject
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  __CFString *v6;
  id v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;

  if (objc_msgSend_isPodcastCollection(self, a2, v2, v3, v4))
    v6 = CFSTR("POPodcastCollection");
  else
    v6 = CFSTR("POPodcastStation");
  v7 = objc_alloc_init(NSClassFromString(&v6->isa));
  objc_msgSend_objectID(self, v8, v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setUuid_(v7, v13, (uint64_t)v12, v14, v15);

  return v7;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  const __CFString *v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend_revisionID(self, v6, v7, v8, v9);
  v15 = objc_msgSend_revisionType(self, v11, v12, v13, v14);
  if (v15 > 2)
    v20 = CFSTR("unknown");
  else
    v20 = *(&off_24D744FF0 + v15);
  objc_msgSend_objectID(self, v16, v17, v18, v19);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v3, v22, (uint64_t)CFSTR("%@ (%p) revisionID: %lu, type: %@, uuid, %@"), v23, v24, v5, self, v10, v20, v21);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  return v25;
}

- (unint64_t)revisionID
{
  return self->_revisionID;
}

- (void)setRevisionID:(unint64_t)a3
{
  self->_revisionID = a3;
}

- (int64_t)revisionType
{
  return self->_revisionType;
}

- (void)setRevisionType:(int64_t)a3
{
  self->_revisionType = a3;
}

- (NSString)objectID
{
  return self->_objectID;
}

- (void)setObjectID:(id)a3
{
  objc_storeStrong((id *)&self->_objectID, a3);
}

- (BOOL)isPodcastCollection
{
  return self->_isPodcastCollection;
}

- (void)setIsPodcastCollection:(BOOL)a3
{
  self->_isPodcastCollection = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_objectID, 0);
}

@end
