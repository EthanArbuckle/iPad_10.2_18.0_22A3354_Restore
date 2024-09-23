@implementation CKChatInputController(DDClientActionsDelegate)

- (void)handleClientActionFromUrl:()DDClientActionsDelegate context:.cold.1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString *getkDataDetectorsReferenceDateKey(void)");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "handleFailureInFunction:file:lineNumber:description:", v0, CFSTR("CKChatInputController_TextInputPayloads.m"), 34, CFSTR("%s"), OUTLINED_FUNCTION_1_7());

  __break(1u);
}

- (void)handleClientActionFromUrl:()DDClientActionsDelegate context:.cold.2()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString *getkDataDetectorsLeadingText(void)");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "handleFailureInFunction:file:lineNumber:description:", v0, CFSTR("CKChatInputController_TextInputPayloads.m"), 36, CFSTR("%s"), OUTLINED_FUNCTION_1_7());

  __break(1u);
}

- (void)handleClientActionFromUrl:()DDClientActionsDelegate context:.cold.3()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString *getkDataDetectorsMiddleText(void)");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "handleFailureInFunction:file:lineNumber:description:", v0, CFSTR("CKChatInputController_TextInputPayloads.m"), 38, CFSTR("%s"), OUTLINED_FUNCTION_1_7());

  __break(1u);
}

- (void)handleClientActionFromUrl:()DDClientActionsDelegate context:.cold.4()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString *getkDataDetectorsTrailingText(void)");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "handleFailureInFunction:file:lineNumber:description:", v0, CFSTR("CKChatInputController_TextInputPayloads.m"), 40, CFSTR("%s"), OUTLINED_FUNCTION_1_7());

  __break(1u);
}

@end
