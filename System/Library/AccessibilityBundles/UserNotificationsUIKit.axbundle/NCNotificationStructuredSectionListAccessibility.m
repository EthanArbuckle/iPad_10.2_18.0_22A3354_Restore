@implementation NCNotificationStructuredSectionListAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("NCNotificationStructuredSectionList");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("NCNotificationRootList"), CFSTR("incomingSectionList"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("NCNotificationStructuredSectionList"), CFSTR("insertNotificationRequest:"), "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("NCNotificationStructuredSectionList"), CFSTR("_existingIndexOfGroupForNotificationRequest:"), "Q", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("NCNotificationStructuredSectionList"), CFSTR("_toggleHiddenNotificationsOnAuthenticationChange:"), "v", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("NCNotificationStructuredSectionList"), CFSTR("removeNotificationGroupListsForMigrationPassingTest:filterRequestsPassingTest:animate:"), "@", "@?", "@?", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("NCNotificationStructuredSectionList"), CFSTR("mergeNotificationGroups:reorderGroupNotifications:"), "v", "@", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("NCNotificationStructuredSectionList"), CFSTR("notificationGroups"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("NCNotificationStructuredSectionList"), CFSTR("delegate"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("NCNotificationStructuredSectionList"), CFSTR("deviceAuthenticated"), "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("NCNotificationListPresentableGroup"), CFSTR("listView"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("NCNotificationListView"), CFSTR("dataSource"), "@", 0);
  objc_msgSend(v3, "validateProtocol:hasRequiredInstanceMethod:", CFSTR("NCNotificationListViewDataSource"), CFSTR("notificationListView:viewForItemAtIndex:"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("NCNotificationListCell"), CFSTR("contentViewController"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("NCNotificationViewController"), CFSTR("_setupStaticContentProvider"), "v", 0);
  if (AXProcessIsSpringBoard())
  {
    objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SpringBoard"), CFSTR("notificationDispatcher"), "@", 0);
    objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("SBNCNotificationDispatcher"), CFSTR("_dispatcher"), "NCNotificationDispatcher");
    objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBNCAlertingController"), CFSTR("screenController"), "@", 0);
    objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBNCScreenController"), CFSTR("canTurnOnScreenForNotificationRequest:"), "B", "@", 0);
  }

}

- (BOOL)_axIgnoreNotification
{
  return __UIAccessibilityGetAssociatedBool();
}

- (void)_axSetIgnoreNotification:(BOOL)a3
{
  __UIAccessibilitySetAssociatedBool();
}

- (void)insertNotificationRequest:(id)a3
{
  id v4;
  void *v5;
  NCNotificationStructuredSectionListAccessibility *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;
  objc_super v24;

  v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)NCNotificationStructuredSectionListAccessibility;
  -[NCNotificationStructuredSectionListAccessibility insertNotificationRequest:](&v24, sel_insertNotificationRequest_, v4);
  if (!-[NCNotificationStructuredSectionListAccessibility _axIgnoreNotification](self, "_axIgnoreNotification")
    && (-[NCNotificationStructuredSectionListAccessibility safeBoolForKey:](self, "safeBoolForKey:", CFSTR("deviceAuthenticated")) & 1) == 0)
  {
    -[NCNotificationStructuredSectionListAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("delegate"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "safeValueForKey:", CFSTR("incomingSectionList"));
    v6 = (NCNotificationStructuredSectionListAccessibility *)objc_claimAutoreleasedReturnValue();

    if (v6 == self)
    {
      v7 = -[NCNotificationStructuredSectionListAccessibility _existingIndexOfGroupForNotificationRequest:](self, "_existingIndexOfGroupForNotificationRequest:", v4);
      if (v7 != 0x7FFFFFFFFFFFFFFFLL)
      {
        v8 = v7;
        -[NCNotificationStructuredSectionListAccessibility safeArrayForKey:](self, "safeArrayForKey:", CFSTR("notificationGroups"));
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "axSafeObjectAtIndex:", v8);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "safeValueForKey:", CFSTR("listView"));
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        v18 = 0;
        v19 = &v18;
        v20 = 0x3032000000;
        v21 = __Block_byref_object_copy__0;
        v22 = __Block_byref_object_dispose__0;
        v23 = 0;
        v17 = v11;
        AXPerformSafeBlock();
        v12 = (id)v19[5];

        _Block_object_dispose(&v18, 8);
        v16 = v12;
        v13 = v12;
        AXPerformSafeBlock();
        objc_msgSend(v13, "accessibilityLabel");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        -[NCNotificationStructuredSectionListAccessibility axStringForRequest:label:](self, "axStringForRequest:label:", v4, v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        UIAccessibilityPostNotification(*MEMORY[0x24BDF71E8], v15);
      }
    }
  }

}

void __78__NCNotificationStructuredSectionListAccessibility_insertNotificationRequest___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "safeValueForKey:", CFSTR("dataSource"));
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "notificationListView:viewForItemAtIndex:", *(_QWORD *)(a1 + 32), 0);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __78__NCNotificationStructuredSectionListAccessibility_insertNotificationRequest___block_invoke_2(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "safeValueForKey:", CFSTR("contentViewController"));
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "_setupStaticContentProvider");

}

- (id)axStringForRequest:(id)a3 label:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  char v27;
  char v28;

  v5 = a3;
  v6 = a4;
  v28 = 0;
  __UIAccessibilitySafeClass();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "safeValueForKey:", CFSTR("notificationDispatcher"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilitySafeClass();
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "safeValueForKey:", CFSTR("_dispatcher"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilitySafeClass();
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "safeValueForKey:", CFSTR("alertingController"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilitySafeClass();
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "safeValueForKey:", CFSTR("screenController"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilitySafeClass();
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v24 = 0;
  v25 = &v24;
  v26 = 0x2020000000;
  v27 = 0;
  v23 = MEMORY[0x24BDAC760];
  v16 = v15;
  v17 = v5;
  AXPerformSafeBlock();
  objc_msgSend(MEMORY[0x24BDFEA60], "axAttributedStringWithString:", v6, v23, 3221225472, __77__NCNotificationStructuredSectionListAccessibility_axStringForRequest_label___block_invoke, &unk_2503BE030);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setAttribute:forKey:", MEMORY[0x24BDBD1C8], *MEMORY[0x24BDFECB0]);
  objc_msgSend(v17, "options");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "lockScreenPersistence");

  if (v20 == 2)
    objc_msgSend(v18, "setAttribute:forKey:", MEMORY[0x24BDBD1C8], *MEMORY[0x24BDFEC18]);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", *((unsigned __int8 *)v25 + 24));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setAttribute:forKey:", v21, *MEMORY[0x24BDFEAD0]);

  _Block_object_dispose(&v24, 8);
  return v18;
}

uint64_t __77__NCNotificationStructuredSectionListAccessibility_axStringForRequest_label___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "canTurnOnScreenForNotificationRequest:", *(_QWORD *)(a1 + 40));
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = result;
  return result;
}

- (void)_toggleHiddenNotificationsOnAuthenticationChange:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  -[NCNotificationStructuredSectionListAccessibility _axSetIgnoreNotification:](self, "_axSetIgnoreNotification:", 1);
  v5.receiver = self;
  v5.super_class = (Class)NCNotificationStructuredSectionListAccessibility;
  -[NCNotificationStructuredSectionListAccessibility _toggleHiddenNotificationsOnAuthenticationChange:](&v5, sel__toggleHiddenNotificationsOnAuthenticationChange_, v3);
  -[NCNotificationStructuredSectionListAccessibility _axSetIgnoreNotification:](self, "_axSetIgnoreNotification:", 0);
}

- (id)removeNotificationGroupListsForMigrationPassingTest:(id)a3 filterRequestsPassingTest:(id)a4 animate:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  void *v10;
  objc_super v12;

  v5 = a5;
  v8 = a4;
  v9 = a3;
  -[NCNotificationStructuredSectionListAccessibility _axSetIgnoreNotification:](self, "_axSetIgnoreNotification:", 1);
  v12.receiver = self;
  v12.super_class = (Class)NCNotificationStructuredSectionListAccessibility;
  -[NCNotificationStructuredSectionListAccessibility removeNotificationGroupListsForMigrationPassingTest:filterRequestsPassingTest:animate:](&v12, sel_removeNotificationGroupListsForMigrationPassingTest_filterRequestsPassingTest_animate_, v9, v8, v5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[NCNotificationStructuredSectionListAccessibility _axSetIgnoreNotification:](self, "_axSetIgnoreNotification:", 0);
  return v10;
}

- (void)mergeNotificationGroups:(id)a3 reorderGroupNotifications:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  objc_super v7;

  v4 = a4;
  v6 = a3;
  -[NCNotificationStructuredSectionListAccessibility _axSetIgnoreNotification:](self, "_axSetIgnoreNotification:", 1);
  v7.receiver = self;
  v7.super_class = (Class)NCNotificationStructuredSectionListAccessibility;
  -[NCNotificationStructuredSectionListAccessibility mergeNotificationGroups:reorderGroupNotifications:](&v7, sel_mergeNotificationGroups_reorderGroupNotifications_, v6, v4);

  -[NCNotificationStructuredSectionListAccessibility _axSetIgnoreNotification:](self, "_axSetIgnoreNotification:", 0);
}

@end
