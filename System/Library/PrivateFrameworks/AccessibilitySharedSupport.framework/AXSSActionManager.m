@implementation AXSSActionManager

- (BOOL)isInteractive
{
  return 0;
}

- (void)goToNextElementOfType:(unint64_t)a3
{
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  FKALogCommon();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    -[AXSSActionManager goToNextElementOfType:].cold.1(a3, v4, v5, v6, v7, v8, v9, v10);

}

- (void)goToPreviousElementOfType:(unint64_t)a3
{
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  FKALogCommon();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    -[AXSSActionManager goToPreviousElementOfType:].cold.1(a3, v4, v5, v6, v7, v8, v9, v10);

}

- (void)goToFirstElement
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_0_2(&dword_1AF5CC000, v0, v1, "goToFirstElement", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)goToLastElement
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_0_2(&dword_1AF5CC000, v0, v1, "goToLastElement", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)goToNextSection
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_0_2(&dword_1AF5CC000, v0, v1, "goToNextSection", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)goToPreviousSection
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_0_2(&dword_1AF5CC000, v0, v1, "goToPreviousSection", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)enterContainer
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_0_2(&dword_1AF5CC000, v0, v1, "enterContainer", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)exitContainer
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_0_2(&dword_1AF5CC000, v0, v1, "exitContainer", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)moveLeft
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_0_2(&dword_1AF5CC000, v0, v1, "moveLeft", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)moveRight
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_0_2(&dword_1AF5CC000, v0, v1, "moveRight", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)moveUp
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_0_2(&dword_1AF5CC000, v0, v1, "moveUp", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)moveDown
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_0_2(&dword_1AF5CC000, v0, v1, "moveDown", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)moveInsideNext
{
  NSObject *v2;

  FKALogCommon();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    -[AXSSActionManager moveDown].cold.1();

}

- (void)moveInsidePrevious
{
  NSObject *v2;

  FKALogCommon();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    -[AXSSActionManager moveDown].cold.1();

}

- (void)performDefaultAction
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_0_2(&dword_1AF5CC000, v0, v1, "performDefaultAction", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)toggleHelp
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_0_2(&dword_1AF5CC000, v0, v1, "toggleHelp", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)openContextualMenu
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_0_2(&dword_1AF5CC000, v0, v1, "openContexualMenu", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)activateSiri
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_0_2(&dword_1AF5CC000, v0, v1, "activateSiri", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)goHome
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_0_2(&dword_1AF5CC000, v0, v1, "goHome", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)toggleAppSwitcher
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_0_2(&dword_1AF5CC000, v0, v1, "toggleAppSwitcher", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)toggleAppLibrary
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_0_2(&dword_1AF5CC000, v0, v1, "toggleAppLibrary", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)toggleQuickNote
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_0_2(&dword_1AF5CC000, v0, v1, "toggleQuickNote", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)lockScreen
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_0_2(&dword_1AF5CC000, v0, v1, "lockScreen", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)activateAccessibilityShortcut
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_0_2(&dword_1AF5CC000, v0, v1, "activateAccessibilityShortcut", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)armApplePay
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_0_2(&dword_1AF5CC000, v0, v1, "armApplePay", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)rebootDevice
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_0_2(&dword_1AF5CC000, v0, v1, "rebootDevice", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)activateSOS
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_0_2(&dword_1AF5CC000, v0, v1, "activateSOS", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)toggleMenuBar
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_0_2(&dword_1AF5CC000, v0, v1, "toggleMenuBar", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)toggleNotificationCenter
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_0_2(&dword_1AF5CC000, v0, v1, "toggleNotificationCenter", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)toggleControlCenter
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_0_2(&dword_1AF5CC000, v0, v1, "toggleControlCenter", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)toggleDock
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_0_2(&dword_1AF5CC000, v0, v1, "toggleDock", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)rotateDevice
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_0_2(&dword_1AF5CC000, v0, v1, "rotateDevice", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)showAccessibilityActions
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_0_2(&dword_1AF5CC000, v0, v1, "showAccessibilityActions", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)performEscape
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_0_2(&dword_1AF5CC000, v0, v1, "performEscape", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (BOOL)handleEscapeKey
{
  NSObject *v2;

  FKALogCommon();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    -[AXSSActionManager handleEscapeKey].cold.1();

  return 0;
}

- (void)performSysdiagnose
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_0_2(&dword_1AF5CC000, v0, v1, "performSysdiagnose", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)activateTypeahead
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_0_2(&dword_1AF5CC000, v0, v1, "typeahead", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)togglePassthroughMode
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_0_2(&dword_1AF5CC000, v0, v1, "togglePassthroughMode", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)toggleWindowList
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_0_2(&dword_1AF5CC000, v0, v1, "toggleWindowList", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)toggleApplicationList
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_0_2(&dword_1AF5CC000, v0, v1, "toggleApplicationList", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)nextButton
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_0_2(&dword_1AF5CC000, v0, v1, "nextButton", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)previousButton
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_0_2(&dword_1AF5CC000, v0, v1, "previousButton", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)nextCheckbox
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_0_2(&dword_1AF5CC000, v0, v1, "nextCheckbox", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)previousCheckbox
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_0_2(&dword_1AF5CC000, v0, v1, "previousCheckbox", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)nextTable
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_0_2(&dword_1AF5CC000, v0, v1, "nextTable", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)previousTable
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_0_2(&dword_1AF5CC000, v0, v1, "previousTable", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)nextImage
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_0_2(&dword_1AF5CC000, v0, v1, "nextImage", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)previousImage
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_0_2(&dword_1AF5CC000, v0, v1, "previousImage", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)nextLink
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_0_2(&dword_1AF5CC000, v0, v1, "nextLink", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)previousLink
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_0_2(&dword_1AF5CC000, v0, v1, "previousLink", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)nextHeading
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_0_2(&dword_1AF5CC000, v0, v1, "nextHeading", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)previousHeading
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_0_2(&dword_1AF5CC000, v0, v1, "previousHeading", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)nextTextField
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_0_2(&dword_1AF5CC000, v0, v1, "nextTextField", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)previousTextField
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_0_2(&dword_1AF5CC000, v0, v1, "previousTextField", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)movePointerToFocus
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_0_2(&dword_1AF5CC000, v0, v1, "movePointerToFocus", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)toggleGesturesMode
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_0_2(&dword_1AF5CC000, v0, v1, "toggleGesturesMode", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)press
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_0_2(&dword_1AF5CC000, v0, v1, "press", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)lift
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_0_2(&dword_1AF5CC000, v0, v1, "lift", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)twoFingerPress
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_0_2(&dword_1AF5CC000, v0, v1, "twoFingerPress", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)twoFingerLift
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_0_2(&dword_1AF5CC000, v0, v1, "twoFingerLift", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)beginSwipeLeft
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_0_2(&dword_1AF5CC000, v0, v1, "beginSwipeLeft", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)beginSwipeRight
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_0_2(&dword_1AF5CC000, v0, v1, "beginSwipeRight", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)beginSwipeUp
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_0_2(&dword_1AF5CC000, v0, v1, "beginSwipeUp", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)beginSwipeDown
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_0_2(&dword_1AF5CC000, v0, v1, "beginSwipeDown", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)endSwipe
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_0_2(&dword_1AF5CC000, v0, v1, "endSwipe", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)beginTwoFingerSwipeLeft
{
  NSObject *v2;

  FKALogCommon();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    -[AXSSActionManager beginSwipeLeft].cold.1();

}

- (void)beginTwoFingerSwipeRight
{
  NSObject *v2;

  FKALogCommon();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    -[AXSSActionManager beginSwipeRight].cold.1();

}

- (void)beginTwoFingerSwipeUp
{
  NSObject *v2;

  FKALogCommon();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    -[AXSSActionManager beginSwipeUp].cold.1();

}

- (void)beginTwoFingerSwipeDown
{
  NSObject *v2;

  FKALogCommon();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    -[AXSSActionManager beginSwipeDown].cold.1();

}

- (void)endTwoFingerSwipe
{
  NSObject *v2;

  FKALogCommon();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    -[AXSSActionManager endSwipe].cold.1();

}

- (void)beginPinchIn
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_0_2(&dword_1AF5CC000, v0, v1, "beginPinchIn", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)beginPinchOut
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_0_2(&dword_1AF5CC000, v0, v1, "beginPinchOut", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)endPinch
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_0_2(&dword_1AF5CC000, v0, v1, "endPinch", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)beginRotateRight
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_0_2(&dword_1AF5CC000, v0, v1, "beginRotateRight", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)beginRotateLeft
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_0_2(&dword_1AF5CC000, v0, v1, "beginRotateLeft", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)endRotate
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_0_2(&dword_1AF5CC000, v0, v1, "endRotate", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)begin3DTouch
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_0_2(&dword_1AF5CC000, v0, v1, "begin3DTouch", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)end3DTouch
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_0_2(&dword_1AF5CC000, v0, v1, "end3DTouch", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)goToNextElementOfType:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3_0(&dword_1AF5CC000, a2, a3, "goToNextElementOfType %ld", a5, a6, a7, a8, 0);
}

- (void)goToPreviousElementOfType:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3_0(&dword_1AF5CC000, a2, a3, "goToPreviousElementOfType %ld", a5, a6, a7, a8, 0);
}

- (void)handleEscapeKey
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_0_2(&dword_1AF5CC000, v0, v1, "handleEscapeKey", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

@end
