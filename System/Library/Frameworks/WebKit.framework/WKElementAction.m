@implementation WKElementAction

uint64_t __57___WKElementAction_elementActionWithTitle_actionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __63___WKElementAction__elementActionWithType_title_actionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __74___WKElementAction__elementActionWithType_customTitle_assistant_disabled___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  return objc_msgSend(a2, "handleElementActionWithType:element:needsInteraction:", *(_QWORD *)(a1 + 32), a3, 1);
}

uint64_t __74___WKElementAction__elementActionWithType_customTitle_assistant_disabled___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  return objc_msgSend(a2, "handleElementActionWithType:element:needsInteraction:", *(_QWORD *)(a1 + 32), a3, 1);
}

uint64_t __74___WKElementAction__elementActionWithType_customTitle_assistant_disabled___block_invoke_3(uint64_t a1, void *a2, uint64_t a3)
{
  return objc_msgSend(a2, "handleElementActionWithType:element:needsInteraction:", *(_QWORD *)(a1 + 32), a3, 1);
}

uint64_t __74___WKElementAction__elementActionWithType_customTitle_assistant_disabled___block_invoke_4(uint64_t a1, uint64_t a2, void *a3)
{
  void *v4;
  void *v5;
  uint64_t v6;

  v4 = (void *)objc_msgSend(a3, "URL");
  v5 = (void *)objc_msgSend(a3, "title");
  if (!v5 || (v6 = (uint64_t)v5, !objc_msgSend(v5, "length")))
    v6 = objc_msgSend(v4, "absoluteString");
  return objc_msgSend((id)objc_msgSend((id)getSSReadingListClass(), "defaultReadingList"), "addReadingListItemWithURL:title:previewText:error:", v4, v6, 0, 0);
}

uint64_t __74___WKElementAction__elementActionWithType_customTitle_assistant_disabled___block_invoke_5(uint64_t a1, void *a2, uint64_t a3)
{
  return objc_msgSend(a2, "handleElementActionWithType:element:needsInteraction:", *(_QWORD *)(a1 + 32), a3, 0);
}

uint64_t __74___WKElementAction__elementActionWithType_customTitle_assistant_disabled___block_invoke_6(uint64_t a1, void *a2, uint64_t a3)
{
  return objc_msgSend(a2, "handleElementActionWithType:element:needsInteraction:", *(_QWORD *)(a1 + 32), a3, 1);
}

uint64_t __74___WKElementAction__elementActionWithType_customTitle_assistant_disabled___block_invoke_7(uint64_t a1, void *a2, uint64_t a3)
{
  return objc_msgSend(a2, "handleElementActionWithType:element:needsInteraction:", *(_QWORD *)(a1 + 32), a3, 1);
}

uint64_t __74___WKElementAction__elementActionWithType_customTitle_assistant_disabled___block_invoke_8(uint64_t a1, void *a2, uint64_t a3)
{
  return objc_msgSend(a2, "handleElementActionWithType:element:needsInteraction:", *(_QWORD *)(a1 + 32), a3, 1);
}

uint64_t __74___WKElementAction__elementActionWithType_customTitle_assistant_disabled___block_invoke_9(uint64_t a1, void *a2, uint64_t a3)
{
  return objc_msgSend(a2, "handleElementActionWithType:element:needsInteraction:", *(_QWORD *)(a1 + 32), a3, 1);
}

uint64_t __74___WKElementAction__elementActionWithType_customTitle_assistant_disabled___block_invoke_10(uint64_t a1, void *a2, uint64_t a3)
{
  return objc_msgSend(a2, "handleElementActionWithType:element:needsInteraction:", *(_QWORD *)(a1 + 32), a3, 1);
}

uint64_t __43___WKElementAction_uiActionForElementInfo___block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  int v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v2 = *(void **)(a1 + 32);
  v3 = qword_1ECE70FD8;
  if (os_log_type_enabled((os_log_t)qword_1ECE70FD8, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 136315138;
    v6 = -[__CFString UTF8String]((id)elementActionTypeToUIActionIdentifier(objc_msgSend(v2, "type")), "UTF8String");
    _os_log_impl(&dword_196BCC000, v3, OS_LOG_TYPE_DEFAULT, "Executing action for type: %s", (uint8_t *)&v5, 0xCu);
  }
  return objc_msgSend(v2, "runActionWithElementInfo:", *(_QWORD *)(a1 + 40));
}

@end
