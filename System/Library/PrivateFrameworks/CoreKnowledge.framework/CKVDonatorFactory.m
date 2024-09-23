@implementation CKVDonatorFactory

- (id)donatorWithCascadeItemType:(unsigned __int16)a3 originAppId:(id)a4 error:(id *)a5
{
  return (id)objc_msgSend(MEMORY[0x1E0D42BD0], "donatorWithServiceProvider:cascadeItemType:originAppId:userId:error:", 0, a3, a4, 0, a5);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serviceProvider, 0);
}

@end
