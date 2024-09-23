@implementation IMFocusStateManager(ChatKit)

- (uint64_t)updateFocusStateForCurrentFocusFilterActionAsync
{
  NSObject *v2;
  uint8_t v4[16];

  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v4 = 0;
      _os_log_impl(&dword_18DFCD000, v2, OS_LOG_TYPE_INFO, "Beginning updating focus filter action.", v4, 2u);
    }

  }
  return objc_msgSend(a1, "updateFocusStateForCurrentFocusFilterAction:", &__block_literal_global_101);
}

- (uint64_t)conversationMatchesActiveFocusMode:()ChatKit
{
  void *v4;
  uint64_t v5;

  objc_msgSend(a3, "chat");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    v5 = objc_msgSend(a1, "chatMatchesActiveFocusMode:", v4);
  else
    v5 = 1;

  return v5;
}

- (uint64_t)chatMatchesActiveFocusMode:()ChatKit
{
  void *v4;
  uint64_t v5;

  objc_msgSend(a3, "participantDNDContactHandles");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(a1, "activeFocusModeMatchesConversationWithHandles:", v4);

  return v5;
}

- (uint64_t)senderMatchesActiveFocusModeForMessage:()ChatKit
{
  void *v4;
  uint64_t v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "sender");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dndContactHandle");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  if (v5)
  {
    v10[0] = v5;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 1);
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(a1, "activeFocusModeMatchesConversationWithHandles:", v7);
  }
  else
  {
    IMLogHandleForCategory();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[IMFocusStateManager(ChatKit) senderMatchesActiveFocusModeForMessage:].cold.1(v7);
    v8 = 0;
  }

  return v8;
}

- (void)senderMatchesActiveFocusModeForMessage:()ChatKit .cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_18DFCD000, log, OS_LOG_TYPE_ERROR, "Could not determine DNDContactHandle for message sender", v1, 2u);
}

@end
