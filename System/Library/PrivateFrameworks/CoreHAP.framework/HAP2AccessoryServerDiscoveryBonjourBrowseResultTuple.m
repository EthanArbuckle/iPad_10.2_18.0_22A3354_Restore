@implementation HAP2AccessoryServerDiscoveryBonjourBrowseResultTuple

- (HAP2AccessoryServerDiscoveryBonjourBrowseResultTuple)initWithPreviousResult:(id)a3 currentResult:(id)a4 changes:(unint64_t)a5
{
  id v9;
  id v10;
  HAP2AccessoryServerDiscoveryBonjourBrowseResultTuple *v11;
  HAP2AccessoryServerDiscoveryBonjourBrowseResultTuple *v12;
  objc_super v14;

  v9 = a3;
  v10 = a4;
  v14.receiver = self;
  v14.super_class = (Class)HAP2AccessoryServerDiscoveryBonjourBrowseResultTuple;
  v11 = -[HAP2AccessoryServerDiscoveryBonjourBrowseResultTuple init](&v14, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_previousResult, a3);
    objc_storeStrong((id *)&v12->_currentResult, a4);
    v12->_changes = a5;
  }

  return v12;
}

- (OS_nw_browse_result)previousResult
{
  return self->_previousResult;
}

- (OS_nw_browse_result)currentResult
{
  return self->_currentResult;
}

- (unint64_t)changes
{
  return self->_changes;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentResult, 0);
  objc_storeStrong((id *)&self->_previousResult, 0);
}

@end
