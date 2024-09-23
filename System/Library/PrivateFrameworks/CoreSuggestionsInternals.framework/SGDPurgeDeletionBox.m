@implementation SGDPurgeDeletionBox

- (SGDPurgeDeletionBox)init
{
  SGDPurgeDeletionBox *v2;
  uint64_t v3;
  NSMutableDictionary *deleteUniqueIds;
  uint64_t v5;
  NSMutableDictionary *purgeUniqueIds;
  uint64_t v7;
  NSMutableDictionary *deleteDomainIds;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)SGDPurgeDeletionBox;
  v2 = -[SGDPurgeDeletionBox init](&v10, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    deleteUniqueIds = v2->_deleteUniqueIds;
    v2->_deleteUniqueIds = (NSMutableDictionary *)v3;

    v5 = objc_opt_new();
    purgeUniqueIds = v2->_purgeUniqueIds;
    v2->_purgeUniqueIds = (NSMutableDictionary *)v5;

    v7 = objc_opt_new();
    deleteDomainIds = v2->_deleteDomainIds;
    v2->_deleteDomainIds = (NSMutableDictionary *)v7;

  }
  return v2;
}

- (BOOL)shouldRunHandlerImmediately
{
  return (unint64_t)-[NSMutableDictionary count](self->_deleteUniqueIds, "count") > 0x1388
      || (unint64_t)-[NSMutableDictionary count](self->_deleteDomainIds, "count") > 0x1388;
}

- (void)addDeletion:(id)a3 domainSelection:(id)a4
{
  NSMutableDictionary *deleteDomainIds;
  id v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  id v12;

  deleteDomainIds = self->_deleteDomainIds;
  v7 = a4;
  v8 = a3;
  -[NSMutableDictionary objectForKey:](deleteDomainIds, "objectForKey:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
    v11 = v9;
  else
    v11 = (id)objc_opt_new();
  v12 = v11;

  objc_msgSend(v12, "addDomainsFromSelection:", v7);
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_deleteDomainIds, "setObject:forKeyedSubscript:", v12, v8);

}

- (void)addDeletion:(id)a3 uniqueIds:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  id v14;

  v14 = a3;
  v6 = a4;
  -[NSMutableDictionary objectForKey:](self->_purgeUniqueIds, "objectForKey:", v14);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
    objc_msgSend(v7, "minusSet:", v6);
  -[NSMutableDictionary objectForKey:](self->_deleteUniqueIds, "objectForKey:", v14);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
    v11 = v9;
  else
    v11 = (id)objc_opt_new();
  v12 = v11;

  objc_msgSend(v6, "allObjects");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "addObjectsFromArray:", v13);

  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_deleteUniqueIds, "setObject:forKeyedSubscript:", v12, v14);
}

- (void)addPurge:(id)a3 uniqueIds:(id)a4
{
  NSMutableDictionary *deleteUniqueIds;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  id v14;

  v14 = a3;
  deleteUniqueIds = self->_deleteUniqueIds;
  v7 = a4;
  -[NSMutableDictionary objectForKey:](deleteUniqueIds, "objectForKey:", v14);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](self->_purgeUniqueIds, "objectForKey:", v14);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
    v11 = v9;
  else
    v11 = (id)objc_opt_new();
  v12 = v11;

  objc_msgSend(v7, "allObjects");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "addObjectsFromArray:", v13);
  if (v8)
    objc_msgSend(v12, "minusSet:", v8);
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_purgeUniqueIds, "setObject:forKeyedSubscript:", v12, v14);

}

- (NSMutableDictionary)deleteUniqueIds
{
  return self->_deleteUniqueIds;
}

- (void)setDeleteUniqueIds:(id)a3
{
  objc_storeStrong((id *)&self->_deleteUniqueIds, a3);
}

- (NSMutableDictionary)purgeUniqueIds
{
  return self->_purgeUniqueIds;
}

- (void)setPurgeUniqueIds:(id)a3
{
  objc_storeStrong((id *)&self->_purgeUniqueIds, a3);
}

- (NSMutableDictionary)deleteDomainIds
{
  return self->_deleteDomainIds;
}

- (void)setDeleteDomainIds:(id)a3
{
  objc_storeStrong((id *)&self->_deleteDomainIds, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deleteDomainIds, 0);
  objc_storeStrong((id *)&self->_purgeUniqueIds, 0);
  objc_storeStrong((id *)&self->_deleteUniqueIds, 0);
}

@end
