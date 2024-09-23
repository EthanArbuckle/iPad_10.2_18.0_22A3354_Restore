@implementation BSProtobufTranslator

void __52___BSProtobufTranslator_BSAuditToken_protobufSchema__block_invoke(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  objc_msgSend(v2, "addField:", "_tokenData");
  objc_msgSend(v2, "addField:", "_bundleID");

}

@end
