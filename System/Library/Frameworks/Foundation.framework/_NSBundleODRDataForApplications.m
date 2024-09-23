@implementation _NSBundleODRDataForApplications

+ (_NSBundleODRDataForApplications)dataForBundle:(int)a3 createIfRequired:
{
  NSMapTable *v5;
  uint64_t v6;
  _NSBundleODRDataForApplications *v7;
  _NSBundleODRDataForApplications *v8;

  objc_opt_self();
  os_unfair_lock_lock((os_unfair_lock_t)&_MergedGlobals_1_0);
  v5 = (NSMapTable *)qword_1ECD05698;
  if (!qword_1ECD05698)
  {
    if (!a3)
    {
      v7 = 0;
      goto LABEL_8;
    }
    v5 = +[NSMapTable strongToStrongObjectsMapTable](NSMapTable, "strongToStrongObjectsMapTable");
    qword_1ECD05698 = (uint64_t)v5;
  }
  v6 = -[NSMapTable objectForKey:](v5, "objectForKey:", a2);
  v7 = (_NSBundleODRDataForApplications *)v6;
  if (a3 && !v6)
  {
    v7 = -[_NSBundleODRDataForApplications initWithBundle:]([_NSBundleODRDataForApplications alloc], "initWithBundle:", a2);
    objc_msgSend((id)qword_1ECD05698, "setObject:forKey:", v7, a2);
    v8 = v7;
  }
LABEL_8:
  os_unfair_lock_unlock((os_unfair_lock_t)&_MergedGlobals_1_0);
  return v7;
}

- (_NSBundleODRDataForApplications)initWithBundle:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  uint64_t v7;
  _QWORD v9[6];
  _QWORD v10[5];
  _QWORD v11[5];
  _QWORD v12[5];
  objc_super v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v13.receiver = self;
  v13.super_class = (Class)_NSBundleODRDataForApplications;
  v4 = -[_NSBundleODRDataCommon initWithBundle:](&v13, sel_initWithBundle_);
  v5 = dispatch_group_create();
  *((_QWORD *)v4 + 8) = v5;
  dispatch_group_enter(v5);
  dispatch_group_enter(*((dispatch_group_t *)v4 + 8));
  v6 = +[NSBundleResourceRequest _connection](NSBundleResourceRequest, "_connection");
  v7 = MEMORY[0x1E0C809B0];
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __50___NSBundleODRDataForApplications_initWithBundle___block_invoke;
  v12[3] = &unk_1E0F4E178;
  v12[4] = v4;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __50___NSBundleODRDataForApplications_initWithBundle___block_invoke_171;
  v11[3] = &unk_1E0F50D00;
  v11[4] = v4;
  objc_msgSend((id)objc_msgSend(v6, "remoteObjectProxyWithErrorHandler:", v12), "tagStateInBundle:completionHandler:", objc_msgSend(a3, "bundleURL"), v11);
  v10[0] = v7;
  v10[1] = 3221225472;
  v10[2] = __50___NSBundleODRDataForApplications_initWithBundle___block_invoke_173;
  v10[3] = &unk_1E0F4E178;
  v10[4] = v4;
  v9[0] = v7;
  v9[1] = 3221225472;
  v9[2] = __50___NSBundleODRDataForApplications_initWithBundle___block_invoke_174;
  v9[3] = &unk_1E0F50D50;
  v9[4] = v4;
  v9[5] = a3;
  objc_msgSend((id)objc_msgSend(+[NSBundleResourceRequest _connection](NSBundleResourceRequest, "_connection"), "remoteObjectProxyWithErrorHandler:", v10), "beginWithBundleURL:completionHandler:", objc_msgSend(a3, "bundleURL"), v9);
  return (_NSBundleODRDataForApplications *)v4;
}

- (void)dealloc
{
  NSMutableSet *extensionConnections;
  objc_super v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  extensionConnections = self->_extensionConnections;
  if (extensionConnections)
  {
    -[NSMutableSet enumerateObjectsUsingBlock:](extensionConnections, "enumerateObjectsUsingBlock:", &__block_literal_global_47);

  }
  dispatch_release((dispatch_object_t)self->_initialStateGroup);
  v4.receiver = self;
  v4.super_class = (Class)_NSBundleODRDataForApplications;
  -[_NSBundleODRDataCommon dealloc](&v4, sel_dealloc);
}

- (id)description
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v3.receiver = self;
  v3.super_class = (Class)_NSBundleODRDataForApplications;
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@\n\tTags State: %@\n\tAsset Packs to URL: %@"), -[_NSBundleODRDataForApplications description](&v3, sel_description), self->_tagToTagState, self->super._assetPackToURL);
}

- (BOOL)assetPacksBecameAvailable:(id)a3 error:(id *)a4
{
  _BOOL4 v6;
  NSMutableSet *extensionConnections;
  _QWORD v9[5];
  objc_super v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v10.receiver = self;
  v10.super_class = (Class)_NSBundleODRDataForApplications;
  v6 = -[_NSBundleODRDataCommon assetPacksBecameAvailable:error:](&v10, sel_assetPacksBecameAvailable_error_, a3, a4);
  if (v6)
  {
    -[NSLock lock](self->super._lock, "lock");
    extensionConnections = self->_extensionConnections;
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __67___NSBundleODRDataForApplications_assetPacksBecameAvailable_error___block_invoke;
    v9[3] = &unk_1E0F50D28;
    v9[4] = a3;
    -[NSMutableSet enumerateObjectsUsingBlock:](extensionConnections, "enumerateObjectsUsingBlock:", v9);
    -[NSLock unlock](self->super._lock, "unlock");
  }
  return v6;
}

- (BOOL)assetPacksBecameUnavailable:(id)a3 error:(id *)a4
{
  _BOOL4 v6;
  NSMutableSet *extensionConnections;
  _QWORD v9[5];
  objc_super v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v10.receiver = self;
  v10.super_class = (Class)_NSBundleODRDataForApplications;
  v6 = -[_NSBundleODRDataCommon assetPacksBecameUnavailable:error:](&v10, sel_assetPacksBecameUnavailable_error_, a3, a4);
  if (v6)
  {
    -[NSLock lock](self->super._lock, "lock");
    extensionConnections = self->_extensionConnections;
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __69___NSBundleODRDataForApplications_assetPacksBecameUnavailable_error___block_invoke;
    v9[3] = &unk_1E0F50D28;
    v9[4] = a3;
    -[NSMutableSet enumerateObjectsUsingBlock:](extensionConnections, "enumerateObjectsUsingBlock:", v9);
    -[NSLock unlock](self->super._lock, "unlock");
  }
  return v6;
}

@end
