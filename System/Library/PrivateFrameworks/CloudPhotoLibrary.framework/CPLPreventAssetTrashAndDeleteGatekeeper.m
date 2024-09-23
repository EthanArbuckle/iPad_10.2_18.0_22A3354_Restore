@implementation CPLPreventAssetTrashAndDeleteGatekeeper

- (int64_t)checkPushedChange:(id)a3
{
  id v4;
  int64_t v5;
  objc_super v7;

  v4 = a3;
  if (!objc_msgSend(v4, "isAssetChange"))
    goto LABEL_6;
  if ((objc_msgSend(v4, "isDelete") & 1) == 0)
  {
    if (objc_msgSend(v4, "inTrash"))
    {
      objc_msgSend(v4, "setInTrash:", 0);
      objc_msgSend(v4, "setDateDeleted:", 0);
      v5 = 2;
      goto LABEL_7;
    }
LABEL_6:
    v7.receiver = self;
    v7.super_class = (Class)CPLPreventAssetTrashAndDeleteGatekeeper;
    v5 = -[CPLPushPullGatekeeper checkPushedChange:](&v7, sel_checkPushedChange_, v4);
    goto LABEL_7;
  }
  v5 = 1;
LABEL_7:

  return v5;
}

@end
