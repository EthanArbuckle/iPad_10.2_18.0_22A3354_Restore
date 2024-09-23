@implementation PFUbiquityMergeConflict

- (PFUbiquityMergeConflict)initWithSource:(id)a3 newVersion:(unint64_t)a4 oldVersion:(unint64_t)a5 cachedSnapshot:(id)a6 persistedSnapshot:(id)a7
{
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PFUbiquityMergeConflict;
  return -[NSMergeConflict initWithSource:newVersion:oldVersion:cachedSnapshot:persistedSnapshot:](&v8, sel_initWithSource_newVersion_oldVersion_cachedSnapshot_persistedSnapshot_, a3, a4, a5, a6, a7);
}

- (void)dealloc
{
  objc_super v3;

  -[PFUbiquityMergeConflict setAncestorSnapshot:](self, "setAncestorSnapshot:", 0);
  v3.receiver = self;
  v3.super_class = (Class)PFUbiquityMergeConflict;
  -[NSMergeConflict dealloc](&v3, sel_dealloc);
}

- (NSDictionary)ancestorSnapshot
{
  return (NSDictionary *)objc_getProperty(self, a2, 56, 1);
}

- (void)setAncestorSnapshot:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

@end
