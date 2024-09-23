void sub_100003CBC(id a1)
{
  void *v1;
  void *v2;
  id v3;

  v1 = (void *)objc_claimAutoreleasedReturnValue(+[IMDaemonController sharedInstance](IMDaemonController, "sharedInstance"));
  objc_msgSend(v1, "addListenerID:capabilities:", CFSTR("MessagesAssistantUIExtension"), kFZListenerCapTruncatedChatRegistry | CKListenerCapabilities());

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[IMDaemonController sharedInstance](IMDaemonController, "sharedInstance"));
  objc_msgSend(v2, "blockUntilConnected");

  v3 = (id)objc_claimAutoreleasedReturnValue(+[IMDaemonController sharedInstance](IMDaemonController, "sharedInstance"));
  objc_msgSend(v3, "_setBlocksConnectionAtResume:", 1);

}

uint64_t sub_100003FB4(uint64_t a1, double a2, double a3)
{
  _BOOL8 v3;

  v3 = a3 != CGSizeZero.height || a2 != CGSizeZero.width;
  return (*(uint64_t (**)(_QWORD, _BOOL8, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), v3, *(_QWORD *)(a1 + 32));
}

id objc_msgSend__balloonMaxWidthForBoundsWidth_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_balloonMaxWidthForBoundsWidth:");
}

id objc_msgSend__balloonViewWithText_color_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_balloonViewWithText:color:");
}

id objc_msgSend__configureSnippetContentViewWithChatAndContactsForAvatarView(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_configureSnippetContentViewWithChatAndContactsForAvatarView");
}

id objc_msgSend__configureSnippetContentViewWithToField_contactsForAvatarView_messageContent_sent_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_configureSnippetContentViewWithToField:contactsForAvatarView:messageContent:sent:");
}

id objc_msgSend__setBlocksConnectionAtResume_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_setBlocksConnectionAtResume:");
}

id objc_msgSend_addAttribute_value_range_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addAttribute:value:range:");
}

id objc_msgSend_addListenerID_capabilities_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addListenerID:capabilities:");
}

id objc_msgSend_addObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addObject:");
}

id objc_msgSend_addSubview_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addSubview:");
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "array");
}

id objc_msgSend_arrayWithObjects_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "arrayWithObjects:count:");
}

id objc_msgSend_avatarNameFont(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "avatarNameFont");
}

id objc_msgSend_balloonMaxWidthForTranscriptWidth_marginInsets_shouldShowPluginButtons_shouldShowCharacterCount_shouldCoverSendButton_isStewieMode_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "balloonMaxWidthForTranscriptWidth:marginInsets:shouldShowPluginButtons:shouldShowCharacterCount:shouldCoverSendButton:isStewieMode:");
}

id objc_msgSend_balloonTextColorForColorType_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "balloonTextColorForColorType:");
}

id objc_msgSend_balloonTextFont(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "balloonTextFont");
}

id objc_msgSend_beginHoldingScrollGeometryUpdatesForReason_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "beginHoldingScrollGeometryUpdatesForReason:");
}

id objc_msgSend_blackColor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "blackColor");
}

id objc_msgSend_blockUntilConnected(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "blockUntilConnected");
}

id objc_msgSend_bounds(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bounds");
}

id objc_msgSend_chatController(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "chatController");
}

id objc_msgSend_code(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "code");
}

id objc_msgSend_color(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "color");
}

id objc_msgSend_componentsJoinedByString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "componentsJoinedByString:");
}

id objc_msgSend_configureWithInteraction_context_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "configureWithInteraction:context:completion:");
}

id objc_msgSend_connectIfNeeded(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "connectIfNeeded");
}

id objc_msgSend_contactIdentifier(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "contactIdentifier");
}

id objc_msgSend_content(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "content");
}

id objc_msgSend_conversationIdentifier(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "conversationIdentifier");
}

id objc_msgSend_conversationListContactImageDiameter(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "conversationListContactImageDiameter");
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "count");
}

id objc_msgSend_countByEnumeratingWithState_objects_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "countByEnumeratingWithState:objects:count:");
}

id objc_msgSend_customIdentifier(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "customIdentifier");
}

id objc_msgSend_descriptorForRequiredKeys(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "descriptorForRequiredKeys");
}

id objc_msgSend_desiredSize(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "desiredSize");
}

id objc_msgSend_displayName(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "displayName");
}

id objc_msgSend_effectWithStyle_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "effectWithStyle:");
}

id objc_msgSend_existingChatForAddresses_allowRetargeting_bestHandles_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "existingChatForAddresses:allowRetargeting:bestHandles:");
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

id objc_msgSend_frame(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "frame");
}

id objc_msgSend_hostedViewMaximumAllowedSize(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "hostedViewMaximumAllowedSize");
}

id objc_msgSend_initWithChat_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithChat:");
}

id objc_msgSend_initWithConversation_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithConversation:");
}

id objc_msgSend_initWithEffect_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithEffect:");
}

id objc_msgSend_initWithFrame_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithFrame:");
}

id objc_msgSend_initWithString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithString:");
}

id objc_msgSend_insertSubview_aboveSubview_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "insertSubview:aboveSubview:");
}

id objc_msgSend_intent(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "intent");
}

id objc_msgSend_intentResponse(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "intentResponse");
}

id objc_msgSend_isEqualToString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isEqualToString:");
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "length");
}

id objc_msgSend_mainScreen(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mainScreen");
}

id objc_msgSend_orderedContactsForAvatarView(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "orderedContactsForAvatarView");
}

id objc_msgSend_parameterForClass_keyPath_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "parameterForClass:keyPath:");
}

id objc_msgSend_predicateForContactsWithIdentifiers_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "predicateForContactsWithIdentifiers:");
}

id objc_msgSend_prepareForDisplay(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "prepareForDisplay");
}

id objc_msgSend_prepareForDisplayIfNeeded(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "prepareForDisplayIfNeeded");
}

id objc_msgSend_recipients(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "recipients");
}

id objc_msgSend_removeFromSuperview(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeFromSuperview");
}

id objc_msgSend_scale(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "scale");
}

id objc_msgSend_setAlpha_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAlpha:");
}

id objc_msgSend_setAsynchronousRendering_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAsynchronousRendering:");
}

id objc_msgSend_setAttributedText_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAttributedText:");
}

id objc_msgSend_setAutoresizingMask_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAutoresizingMask:");
}

id objc_msgSend_setBackgroundColor_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setBackgroundColor:");
}

id objc_msgSend_setCanUseOpaqueMask_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setCanUseOpaqueMask:");
}

id objc_msgSend_setChatContent_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setChatContent:");
}

id objc_msgSend_setChatController_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setChatController:");
}

id objc_msgSend_setChatView_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setChatView:");
}

id objc_msgSend_setColor_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setColor:");
}

id objc_msgSend_setContact_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setContact:");
}

id objc_msgSend_setContacts_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setContacts:");
}

id objc_msgSend_setContactsForAvatarView_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setContactsForAvatarView:");
}

id objc_msgSend_setFont_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setFont:");
}

id objc_msgSend_setFrame_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setFrame:");
}

id objc_msgSend_setHasTail_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setHasTail:");
}

id objc_msgSend_setLoadedMessageCount_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setLoadedMessageCount:");
}

id objc_msgSend_setMessageContent_sent_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setMessageContent:sent:");
}

id objc_msgSend_setNeedsLayout(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setNeedsLayout");
}

id objc_msgSend_setNumberOfLines_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setNumberOfLines:");
}

id objc_msgSend_setOrientation_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setOrientation:");
}

id objc_msgSend_setShowsContactOnTap_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setShowsContactOnTap:");
}

id objc_msgSend_setText_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setText:");
}

id objc_msgSend_setTextAlignment_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTextAlignment:");
}

id objc_msgSend_setTextColor_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTextColor:");
}

id objc_msgSend_setToFieldText_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setToFieldText:");
}

id objc_msgSend_setUserInteractionEnabled_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setUserInteractionEnabled:");
}

id objc_msgSend_setWithObjects_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setWithObjects:");
}

id objc_msgSend_sharedBehaviors(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sharedBehaviors");
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sharedInstance");
}

id objc_msgSend_sharedRegistry(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sharedRegistry");
}

id objc_msgSend_sizeThatFits_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sizeThatFits:");
}

id objc_msgSend_speakableGroupName(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "speakableGroupName");
}

id objc_msgSend_spokenPhrase(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "spokenPhrase");
}

id objc_msgSend_standardUserDefaults(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "standardUserDefaults");
}

id objc_msgSend_stringWithFormat_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringWithFormat:");
}

id objc_msgSend_text(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "text");
}

id objc_msgSend_theme(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "theme");
}

id objc_msgSend_unifiedContactsMatchingPredicate_keysToFetch_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "unifiedContactsMatchingPredicate:keysToFetch:error:");
}

id objc_msgSend_view(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "view");
}

id objc_msgSend_whiteColor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "whiteColor");
}
