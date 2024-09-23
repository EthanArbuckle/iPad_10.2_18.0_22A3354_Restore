@implementation CNAssistantCommandClear

- (void)setContactStore:(id)a3
{
  objc_storeStrong((id *)&self->_contactStore, a3);
}

- (CNContactStore)contactStore
{
  CNContactStore *contactStore;
  CNContactStore *v4;
  CNContactStore *v5;

  contactStore = self->_contactStore;
  if (!contactStore)
  {
    v4 = (CNContactStore *)objc_alloc_init(MEMORY[0x24BDBACF8]);
    v5 = self->_contactStore;
    self->_contactStore = v4;

    contactStore = self->_contactStore;
  }
  return contactStore;
}

- (void)clearAceDomainObjects
{
  uint64_t v2;
  NSObject *v3;

  if ((objc_msgSend_removeAllUpdates(CNAssistantCache, a2, v2) & 1) == 0)
  {
    v3 = *MEMORY[0x24BE08FE8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FE8], OS_LOG_TYPE_DEBUG))
      sub_216344F1C(v3);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contactStore, 0);
}

@end
