@implementation EKGroupInfoButton

- (CUIKGroupInfo)groupInfo
{
  return (CUIKGroupInfo *)objc_loadWeakRetained((id *)&self->_groupInfo);
}

- (void)setGroupInfo:(id)a3
{
  objc_storeWeak((id *)&self->_groupInfo, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_groupInfo);
}

@end
