void sub_100001F14(id a1)
{
  uint64_t v1;
  void *v2;

  v1 = objc_claimAutoreleasedReturnValue(+[NSXPCInterface interfaceWithProtocol:](NSXPCInterface, "interfaceWithProtocol:", &OBJC_PROTOCOL___NSObject));
  v2 = (void *)qword_100008E18;
  qword_100008E18 = v1;

}

void sub_100001F88(id a1)
{
  uint64_t v1;
  void *v2;

  v1 = objc_claimAutoreleasedReturnValue(+[NSXPCInterface interfaceWithProtocol:](NSXPCInterface, "interfaceWithProtocol:", &OBJC_PROTOCOL___SLConversationExtensionHostProtocol));
  v2 = (void *)qword_100008E28;
  qword_100008E28 = v1;

}

void sub_100002110(id a1)
{
  void *v1;
  void *v2;
  id v3;

  v1 = (void *)objc_claimAutoreleasedReturnValue(+[IMDaemonController sharedInstance](IMDaemonController, "sharedInstance"));
  objc_msgSend(v1, "addListenerID:capabilities:", CFSTR("com.apple.MobileSMS.MessagesTranscriptExtension"), kFZListenerCapNotifications | kFZListenerCapManageStatus | kFZListenerCapChats | kFZListenerCapFileTransfers | kFZListenerCapIDQueries | kFZListenerCapOnDemandChatRegistry | kFZListenerCapMessageHistory | (kFZListenerCapModifyReadState | kFZListenerCapSendMessages));

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[IMDaemonController sharedInstance](IMDaemonController, "sharedInstance"));
  objc_msgSend(v2, "blockUntilConnected");

  v3 = (id)objc_claimAutoreleasedReturnValue(+[IMDaemonController sharedInstance](IMDaemonController, "sharedInstance"));
  objc_msgSend(v3, "_setBlocksConnectionAtResume:", 1);

}

void sub_100002214(id a1)
{
  id v1;

  v1 = +[IMBalloonPluginManager sharedInstance](IMBalloonPluginManager, "sharedInstance");
}

void sub_100002238(id a1)
{
  +[CKSocialLayerChatController initialize](CKSocialLayerChatController, "initialize");
}

id objc_msgSend__auxiliaryConnection(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_auxiliaryConnection");
}

id objc_msgSend__setBlocksConnectionAtResume_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_setBlocksConnectionAtResume:");
}

id objc_msgSend_addListenerID_capabilities_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addListenerID:capabilities:");
}

id objc_msgSend_arrayWithObjects_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "arrayWithObjects:count:");
}

id objc_msgSend_blockUntilConnected(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "blockUntilConnected");
}

id objc_msgSend_chatIdentifierForMessageWithGUID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "chatIdentifierForMessageWithGUID:");
}

id objc_msgSend_existingChatWithChatIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "existingChatWithChatIdentifier:");
}

id objc_msgSend_extensionContext(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "extensionContext");
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "firstObject");
}

id objc_msgSend_initWithChat_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithChat:");
}

id objc_msgSend_initWithConversation_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithConversation:");
}

id objc_msgSend_inputItems(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "inputItems");
}

id objc_msgSend_interfaceWithProtocol_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "interfaceWithProtocol:");
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "length");
}

id objc_msgSend_openURL_completionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "openURL:completionHandler:");
}

id objc_msgSend_presentConversationWithMessageGUID_attachmentGUID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "presentConversationWithMessageGUID:attachmentGUID:");
}

id objc_msgSend_remoteObjectProxy(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "remoteObjectProxy");
}

id objc_msgSend_remoteProxy(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "remoteProxy");
}

id objc_msgSend_requestDismissal(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "requestDismissal");
}

id objc_msgSend_setAttachmentGUID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAttachmentGUID:");
}

id objc_msgSend_setDelegate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDelegate:");
}

id objc_msgSend_setLoadedMessageCount_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setLoadedMessageCount:");
}

id objc_msgSend_setMessageGUID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setMessageGUID:");
}

id objc_msgSend_setViewControllers_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setViewControllers:");
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sharedInstance");
}

id objc_msgSend_sharedRegistry(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sharedRegistry");
}

id objc_msgSend_userInfo(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "userInfo");
}

id objc_msgSend_valueForKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "valueForKey:");
}
