@implementation AAUICustodianRepairHelper

- (void)setLocalContacts:(id)a3
{
  id v5;
  NSObject *v6;
  id WeakRetained;

  v5 = a3;
  objc_storeStrong((id *)&self->_localContacts, a3);
  _AAUILogSystem();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    -[AAUICustodianRepairHelper setLocalContacts:].cold.1(v5, v6);

  WeakRetained = objc_loadWeakRetained((id *)&self->_dataDelegate);
  objc_msgSend(WeakRetained, "didFinishFetchingCustodians");

}

- (void)setDataDelegate:(id)a3
{
  AAUICustodianDataDelegate **p_dataDelegate;
  id WeakRetained;

  p_dataDelegate = &self->_dataDelegate;
  objc_storeWeak((id *)&self->_dataDelegate, a3);
  if (-[NSArray count](self->_localContacts, "count"))
  {
    WeakRetained = objc_loadWeakRetained((id *)p_dataDelegate);
    objc_msgSend(WeakRetained, "didFinishFetchingCustodians");

  }
}

- (NSArray)localContacts
{
  return self->_localContacts;
}

- (AAUICustodianDataDelegate)dataDelegate
{
  return (AAUICustodianDataDelegate *)objc_loadWeakRetained((id *)&self->_dataDelegate);
}

- (AAUIRepairDelegate)repairDelegate
{
  return (AAUIRepairDelegate *)objc_loadWeakRetained((id *)&self->_repairDelegate);
}

- (void)setRepairDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_repairDelegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_repairDelegate);
  objc_destroyWeak((id *)&self->_dataDelegate);
  objc_storeStrong((id *)&self->_localContacts, 0);
}

- (void)setLocalContacts:(void *)a1 .cold.1(void *a1, NSObject *a2)
{
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v3 = 134217984;
  v4 = objc_msgSend(a1, "count");
  _os_log_debug_impl(&dword_1DB4ED000, a2, OS_LOG_TYPE_DEBUG, "Setting %lu Local Contacts in Data Fetcher", (uint8_t *)&v3, 0xCu);
}

@end
