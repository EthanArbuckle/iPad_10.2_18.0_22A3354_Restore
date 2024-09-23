@implementation NPKPeerPaymentLookupRecipientInformation

void __NPKPeerPaymentLookupRecipientInformation_block_invoke(uint64_t a1)
{
  id v2;

  +[NPKPeerPaymentConversationManager sharedInstance](NPKPeerPaymentConversationManager, "sharedInstance");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "lookupRecipientInformationWithAddress:senderAddress:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

@end
