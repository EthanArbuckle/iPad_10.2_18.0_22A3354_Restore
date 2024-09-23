@implementation SFNavigationBarURLButton

void __60___SFNavigationBarURLButton__updateBackgroundImageAnimated___block_invoke(uint64_t a1)
{
  -[_SFNavigationBarURLButton _updateEffectView](*(_QWORD *)(a1 + 32));
}

void __110___SFNavigationBarURLButton__scribbleInteraction_focusElement_initialFocusSelectionReferencePoint_completion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;

  v2 = WBS_LOG_CHANNEL_PREFIXPencilInput();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __110___SFNavigationBarURLButton__scribbleInteraction_focusElement_initialFocusSelectionReferencePoint_completion___block_invoke_cold_1();
  v3 = *(_QWORD *)(a1 + 48);
  objc_msgSend(*(id *)(a1 + 32), "textFieldForNavigationBarURLButton:", *(_QWORD *)(a1 + 40));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *))(v3 + 16))(v3, v4);

}

void __110___SFNavigationBarURLButton__scribbleInteraction_focusElement_initialFocusSelectionReferencePoint_completion___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_5(&dword_1A3B2D000, v0, v1, "Calling completionHandler for -_scribbleInteraction:focusElement:initialFocusSelectionReferencePoint:completion:", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

@end
