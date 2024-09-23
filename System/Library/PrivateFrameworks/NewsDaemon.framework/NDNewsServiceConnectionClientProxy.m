@implementation NDNewsServiceConnectionClientProxy

- (void)serviceHasNewTodayResults
{
  id v2;

  -[NDNewsServiceConnectionClientProxy client](self, "client");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "serviceHasNewTodayResults");

}

- (NDNewsServiceClient)client
{
  return (NDNewsServiceClient *)objc_loadWeakRetained((id *)&self->_client);
}

- (void)setClient:(id)a3
{
  objc_storeWeak((id *)&self->_client, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_client);
}

@end
