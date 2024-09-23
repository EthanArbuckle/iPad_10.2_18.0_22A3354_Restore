@implementation HSSetupServiceSelectedRoomItemProvider

- (HSSetupServiceSelectedRoomItemProvider)init
{
  void *v4;
  NSString *v5;
  void *v6;

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
  v5 = NSStringFromSelector("initWithServiceLikeBuilder:");
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HSSetupServiceSelectedRoomItemProvider.m"), 23, CFSTR("%s is unavailable; use %@ instead"),
    "-[HSSetupServiceSelectedRoomItemProvider init]",
    v6);

  return 0;
}

- (HSSetupServiceSelectedRoomItemProvider)initWithServiceLikeBuilder:(id)a3
{
  id v4;
  HSSetupServiceSelectedRoomItemProvider *v5;
  HSSetupServiceSelectedRoomItemProvider *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)HSSetupServiceSelectedRoomItemProvider;
  v5 = -[HSSetupServiceSelectedRoomItemProvider init](&v8, "init");
  v6 = v5;
  if (v5)
    -[HSSetupServiceSelectedRoomItemProvider setServiceLikeBuilder:](v5, "setServiceLikeBuilder:", v4);

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = objc_alloc((Class)objc_opt_class(self, a2));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[HSSetupServiceSelectedRoomItemProvider serviceLikeBuilder](self, "serviceLikeBuilder"));
  v6 = objc_msgSend(v4, "initWithServiceLikeBuilder:", v5);

  return v6;
}

- (id)reloadItems
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  unsigned int (**v8)(_QWORD, _QWORD);
  void *v9;
  id v10;
  unsigned int v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  id v16;
  id v17;
  void *v18;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[HSSetupServiceSelectedRoomItemProvider roomBuilderItem](self, "roomBuilderItem"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "roomBuilder"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[HSSetupServiceSelectedRoomItemProvider serviceLikeBuilder](self, "serviceLikeBuilder"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "room"));

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[HSSetupServiceSelectedRoomItemProvider filter](self, "filter"));
  if (v7)
  {
    v8 = (unsigned int (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue(-[HSSetupServiceSelectedRoomItemProvider filter](self, "filter"));
    if (((unsigned int (**)(_QWORD, void *))v8)[2](v8, v6))
      v9 = v6;
    else
      v9 = 0;
    v10 = v9;

    v6 = v10;
  }
  if (v4 == v6)
    v11 = objc_msgSend(v4, "isEqual:", v4) ^ 1;
  else
    v11 = 1;
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
  if (v3)
    v15 = v11;
  else
    v15 = 1;
  if (v6 && v15)
  {
    v16 = objc_msgSend(objc_alloc((Class)HFRoomBuilderItem), "initWithRoomBuilder:", v6);
    objc_msgSend(v12, "addObject:", v16);
    -[HSSetupServiceSelectedRoomItemProvider setRoomBuilderItem:](self, "setRoomBuilderItem:", v16);

  }
  if (v3 && ((v11 ^ 1) & 1) == 0)
    objc_msgSend(v14, "addObject:", v3);
  if ((v15 & 1) == 0)
    objc_msgSend(v13, "addObject:", v3);
  v17 = objc_msgSend(objc_alloc((Class)HFItemProviderReloadResults), "initWithAddedItems:removedItems:existingItems:", v12, v14, v13);
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NAFuture futureWithResult:](NAFuture, "futureWithResult:", v17));

  return v18;
}

- (id)items
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[HSSetupServiceSelectedRoomItemProvider roomBuilderItem](self, "roomBuilderItem"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet na_setWithSafeObject:](NSSet, "na_setWithSafeObject:", v2));

  return v3;
}

- (id)invalidationReasons
{
  id v2;
  void *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)HSSetupServiceSelectedRoomItemProvider;
  v2 = -[HSSetupServiceSelectedRoomItemProvider invalidationReasons](&v6, "invalidationReasons");
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "setByAddingObject:", HFItemProviderInvalidationReasonRoom));

  return v4;
}

- (id)filter
{
  return self->_filter;
}

- (void)setFilter:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (HFServiceLikeBuilder)serviceLikeBuilder
{
  return self->_serviceLikeBuilder;
}

- (void)setServiceLikeBuilder:(id)a3
{
  objc_storeStrong((id *)&self->_serviceLikeBuilder, a3);
}

- (HFRoomBuilderItem)roomBuilderItem
{
  return self->_roomBuilderItem;
}

- (void)setRoomBuilderItem:(id)a3
{
  objc_storeStrong((id *)&self->_roomBuilderItem, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_roomBuilderItem, 0);
  objc_storeStrong((id *)&self->_serviceLikeBuilder, 0);
  objc_storeStrong(&self->_filter, 0);
}

@end
