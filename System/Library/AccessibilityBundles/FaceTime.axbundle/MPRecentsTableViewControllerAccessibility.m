@implementation MPRecentsTableViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("MPRecentsTableViewController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:", CFSTR("CHRecentCall"));
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("MPRecentsTableViewCell"), CFSTR("UITableViewCell"));
  objc_msgSend(v3, "validateClass:hasSwiftField:withSwiftType:", CFSTR("MPRecentsTableViewCell"), CFSTR("listItemViewHelper"), "Optional<RecentsListItemViewHelper>");
  objc_msgSend(v3, "validateClass:hasSwiftField:withSwiftType:", CFSTR("TelephonyUI.RecentsListItemViewHelper"), CFSTR("titleLabel"), "UILabel");
  objc_msgSend(v3, "validateClass:hasSwiftField:withSwiftType:", CFSTR("TelephonyUI.RecentsListItemViewHelper"), CFSTR("subtitleLabel"), "UILabel");
  objc_msgSend(v3, "validateClass:hasSwiftField:withSwiftType:", CFSTR("TelephonyUI.RecentsListItemViewHelper"), CFSTR("messageIndicatorView"), "Optional<MessageIndicatorView>");
  objc_msgSend(v3, "validateClass:hasSwiftField:withSwiftType:", CFSTR("TelephonyUI.MessageIndicatorView"), CFSTR("titleLabel"), "UILabel");
  objc_msgSend(v3, "validateClass:hasSwiftField:withSwiftType:", CFSTR("TelephonyUI.MessageIndicatorView"), CFSTR("durationLabel"), "UILabel");
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("TelephonyUI.MessageIndicatorView"), CFSTR("handleTapGesture"), "v", 0);
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("MPLegacyRecentsTableViewCell"), CFSTR("PHTableViewCell"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PHTableViewCell"), CFSTR("titleLabel"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PHTableViewCell"), CFSTR("subtitleLabel"), "@", 0);
  objc_msgSend(v3, "validateClass:conformsToProtocol:", CFSTR("MPRecentsTableViewController"), CFSTR("UITableViewDataSource"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MPRecentsTableViewController"), CFSTR("tableView:cellForRowAtIndexPath:"), "@", "@", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MPRecentsTableViewController"), CFSTR("recentCallAtTableViewIndex:"), "@", "q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MPRecentsTableViewController"), CFSTR("setEditing:animated:"), "v", "B", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MPRecentsTableViewController"), CFSTR("reloadDataSource"), "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CHRecentCall"), CFSTR("ph_supportsLocalParticipantBadge"), "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MPRecentsTableViewController"), CFSTR("showRecentCallDetailsViewControllerForRecentCall:animated:"), "v", "@", "B", 0);

}

- (void)_accessibilityTableView:(id)a3 prepareForRowActionHandlingForIndexPath:(id)a4
{
  -[MPRecentsTableViewControllerAccessibility _accessibilitySetBoolValue:forKey:](self, "_accessibilitySetBoolValue:forKey:", -[MPRecentsTableViewControllerAccessibility safeBoolForKey:](self, "safeBoolForKey:", CFSTR("isEditing"), a4), CFSTR("wasEditing"));
  AXPerformSafeBlock();
}

uint64_t __109__MPRecentsTableViewControllerAccessibility__accessibilityTableView_prepareForRowActionHandlingForIndexPath___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setEditing:animated:", 1, 0);
}

- (void)_accessibilityTableView:(id)a3 endRowActionHandlingForIndexPath:(id)a4
{
  AXPerformBlockOnMainThreadAfterDelay();
}

uint64_t __102__MPRecentsTableViewControllerAccessibility__accessibilityTableView_endRowActionHandlingForIndexPath___block_invoke()
{
  return AXPerformSafeBlock();
}

uint64_t __102__MPRecentsTableViewControllerAccessibility__accessibilityTableView_endRowActionHandlingForIndexPath___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setEditing:animated:", objc_msgSend(*(id *)(a1 + 32), "_accessibilityBoolValueForKey:", CFSTR("wasEditing")), 0);
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  void *v38;
  int v39;
  int v40;
  _DWORD *v41;
  void *v42;
  _DWORD *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  void *v48;
  __CFString *v49;
  void *v50;
  uint64_t v51;
  __CFString *v52;
  uint64_t v53;
  void *v54;
  uint64_t v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  uint64_t v66;
  void *v67;
  void *v68;
  void *v69;
  void *v71;
  const __CFString *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  _QWORD v85[4];
  id v86;
  uint64_t v87;
  uint64_t v88;
  void (*v89)(uint64_t);
  void *v90;
  MPRecentsTableViewControllerAccessibility *v91;
  id v92;
  uint64_t *v93;
  uint64_t v94;
  uint64_t *v95;
  uint64_t v96;
  uint64_t (*v97)(uint64_t, uint64_t);
  void (*v98)(uint64_t);
  id v99;
  char v100;
  objc_super v101;

  v6 = a3;
  v7 = a4;
  v101.receiver = self;
  v101.super_class = (Class)MPRecentsTableViewControllerAccessibility;
  -[MPRecentsTableViewControllerAccessibility tableView:cellForRowAtIndexPath:](&v101, sel_tableView_cellForRowAtIndexPath_, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v100 = 0;
  objc_opt_class();
  v94 = 0;
  v95 = &v94;
  v96 = 0x3032000000;
  v97 = __Block_byref_object_copy_;
  v98 = __Block_byref_object_dispose_;
  v99 = 0;
  v87 = MEMORY[0x24BDAC760];
  v88 = 3221225472;
  v89 = __77__MPRecentsTableViewControllerAccessibility_tableView_cellForRowAtIndexPath___block_invoke;
  v90 = &unk_2502074B8;
  v93 = &v94;
  v91 = self;
  v9 = v7;
  v92 = v9;
  AXPerformSafeBlock();
  v10 = (id)v95[5];

  _Block_object_dispose(&v94, 8);
  __UIAccessibilityCastAsClass();
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v100)
    goto LABEL_49;
  NSClassFromString(CFSTR("MPRecentsTableViewCell"));
  v77 = v9;
  v78 = v6;
  v79 = v11;
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    LOBYTE(v94) = 0;
    objc_opt_class();
    objc_msgSend(v8, "safeValueForKey:", CFSTR("titleLabel"));
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    __UIAccessibilityCastAsClass();
    v34 = (void *)objc_claimAutoreleasedReturnValue();

    if (!(_BYTE)v94)
    {
      objc_msgSend(v34, "accessibilityLabel");
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      LOBYTE(v94) = 0;
      objc_opt_class();
      objc_msgSend(v8, "safeValueForKey:", CFSTR("subtitleLabel"));
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      __UIAccessibilityCastAsClass();
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      if (!(_BYTE)v94)
      {
        objc_msgSend(v12, "accessibilityLabel");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v73 = 0;
        goto LABEL_12;
      }
    }
LABEL_49:
    abort();
  }
  objc_msgSend(v8, "safeSwiftValueForKey:", CFSTR("listItemViewHelper"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v94) = 0;
  objc_opt_class();
  objc_msgSend(v12, "safeSwiftValueForKey:", CFSTR("titleLabel"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if ((_BYTE)v94)
    goto LABEL_49;
  objc_msgSend(v14, "accessibilityLabel");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v94) = 0;
  objc_opt_class();
  objc_msgSend(v12, "safeSwiftValueForKey:", CFSTR("subtitleLabel"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if ((_BYTE)v94)
    goto LABEL_49;
  objc_msgSend(v17, "accessibilityLabel");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "safeSwiftValueForKey:", CFSTR("messageIndicatorView"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (v19)
  {
    objc_msgSend(v19, "safeSwiftValueForKey:", CFSTR("titleLabel"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "accessibilityLabel");
    v22 = v18;
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v19, "safeSwiftValueForKey:", CFSTR("durationLabel"));
    v81 = v15;
    v83 = v22;
    v24 = v8;
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "accessibilityLabel");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    AXDurationForDurationString();
    AXDurationStringForDuration();
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    __UIAXStringForVariables();
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = objc_alloc(MEMORY[0x24BDF6788]);
    v29 = (void *)MEMORY[0x24BDD17C8];
    accessibilityLocalizedString(CFSTR("play.message"));
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "stringWithFormat:", v30, v23, CFSTR("__AXStringForVariablesSentinel"));
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v85[0] = MEMORY[0x24BDAC760];
    v85[1] = 3221225472;
    v85[2] = __77__MPRecentsTableViewControllerAccessibility_tableView_cellForRowAtIndexPath___block_invoke_2;
    v85[3] = &unk_2502074E0;
    v86 = v19;
    v32 = (void *)objc_msgSend(v28, "initWithName:actionHandler:", v31, v85);

    objc_msgSend(v20, "addObject:", v32);
    v8 = v24;
    v15 = v81;

    v18 = v83;
    v11 = v79;
  }
  else
  {
    v73 = 0;
  }
  objc_msgSend(v8, "setAccessibilityCustomActions:", v20);

LABEL_12:
  v76 = v8;
  if (v15)
  {
    objc_msgSend(MEMORY[0x24BDD14A8], "decimalDigitCharacterSet");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = objc_msgSend(v15, "rangeOfCharacterFromSet:", v36);

    if (v37 != 0x7FFFFFFFFFFFFFFFLL)
    {
      objc_msgSend(MEMORY[0x24BDFEA60], "axAttributedStringWithString:", v15);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "setAttribute:forKey:", *MEMORY[0x24BDBD270], *MEMORY[0x24BDFEC08]);

      v15 = v38;
    }
  }
  v39 = objc_msgSend(v11, "callStatus");
  v40 = v39;
  v41 = (_DWORD *)MEMORY[0x24BE14980];
  if ((*MEMORY[0x24BE14970] & v39) != 0 || (*MEMORY[0x24BE14980] & v39) != 0)
  {
    accessibilityLocalizedString(CFSTR("call.incoming"));
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    v72 = CFSTR("__AXStringForVariablesSentinel");
    __UIAXStringForVariables();
    v42 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v42 = 0;
  }
  v43 = (_DWORD *)MEMORY[0x24BE14960];
  if ((*MEMORY[0x24BE14978] & v40) != 0 || (*MEMORY[0x24BE14960] & v40) != 0)
  {
    accessibilityLocalizedString(CFSTR("call.outgoing"));
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    v72 = CFSTR("__AXStringForVariablesSentinel");
    __UIAXStringForVariables();
    v44 = objc_claimAutoreleasedReturnValue();

    v42 = (void *)v44;
  }
  if ((*v41 & v40) != 0)
  {
    accessibilityLocalizedString(CFSTR("call.missed"));
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    v72 = CFSTR("__AXStringForVariablesSentinel");
    __UIAXStringForVariables();
    v45 = objc_claimAutoreleasedReturnValue();

    v42 = (void *)v45;
  }
  if ((*v43 & v40) != 0)
  {
    accessibilityLocalizedString(CFSTR("call.canceled"));
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    v72 = CFSTR("__AXStringForVariablesSentinel");
    __UIAXStringForVariables();
    v46 = objc_claimAutoreleasedReturnValue();

    v42 = (void *)v46;
  }
  v47 = objc_msgSend(v11, "mediaType", v71, v72);
  objc_msgSend(v11, "serviceProvider");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v48, "isEqualToString:", *MEMORY[0x24BE149C8]))
  {
    v50 = 0;
    goto LABEL_35;
  }
  if (v47 == 2)
  {
    v49 = CFSTR("application.name.facetime");
    goto LABEL_31;
  }
  if (v47 == 1)
  {
    v49 = CFSTR("facetime.audio");
LABEL_31:
    accessibilityLocalizedString(v49);
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_33;
  }
  v50 = 0;
LABEL_33:
  if (objc_msgSend(v18, "containsString:", v50))
  {

    v50 = v18;
    v18 = 0;
  }
LABEL_35:
  v51 = objc_msgSend(v11, "ttyType");
  if (v51 == 1)
  {
    v52 = CFSTR("call.type.tty");
    goto LABEL_39;
  }
  if (v51 == 2)
  {
    v52 = CFSTR("call.type.tty.relay");
LABEL_39:
    accessibilityLocalizedString(v52);
    v53 = objc_claimAutoreleasedReturnValue();
    goto LABEL_41;
  }
  v53 = 0;
LABEL_41:
  v84 = v18;
  objc_msgSend(v11, "callOccurrences");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  v55 = objc_msgSend(v54, "count");

  v74 = (void *)v53;
  v75 = v48;
  v82 = v15;
  if (v55)
  {
    v56 = (void *)MEMORY[0x24BDD17C8];
    accessibilityLocalizedString(CFSTR("num.calls"));
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v56, "localizedStringWithFormat:", v57, v55);
    v58 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v58 = 0;
  }
  objc_msgSend(v11, "date");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1500], "localizedStringFromDate:dateStyle:timeStyle:", v59, 3, 1);
  v60 = v11;
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEB4938], "sharedInstance");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v62, "providerManager");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v63, "telephonyProvider");
  v64 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v64, "prioritizedSenderIdentities");
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  v66 = objc_msgSend(v65, "count");

  objc_msgSend(v60, "localParticipantUUID");
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v64, "senderIdentityForAccountUUID:", v67);
  v80 = (void *)objc_claimAutoreleasedReturnValue();

  v68 = 0;
  if (objc_msgSend(v60, "safeBoolForKey:", CFSTR("ph_supportsLocalParticipantBadge")) && v66 >= 2)
  {
    objc_msgSend(v80, "localizedName");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
  }
  __UIAXStringForVariables();
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v76, "setAccessibilityLabel:", v69, v42, v68, v74, v50, v58, v84, v61, v73, CFSTR("__AXStringForVariablesSentinel"));
  objc_msgSend(v76, "setIsAccessibilityElement:", 1);

  return v76;
}

void __77__MPRecentsTableViewControllerAccessibility_tableView_cellForRowAtIndexPath___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "recentCallAtTableViewIndex:", objc_msgSend(*(id *)(a1 + 40), "row"));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

uint64_t __77__MPRecentsTableViewControllerAccessibility_tableView_cellForRowAtIndexPath___block_invoke_2(uint64_t a1)
{
  id v2;

  v2 = *(id *)(a1 + 32);
  AXPerformSafeBlock();

  return 1;
}

uint64_t __77__MPRecentsTableViewControllerAccessibility_tableView_cellForRowAtIndexPath___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "handleTapGesture");
}

- (void)_accessibilityLoadAccessibilityInformation
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)MPRecentsTableViewControllerAccessibility;
  -[MPRecentsTableViewControllerAccessibility _accessibilityLoadAccessibilityInformation](&v2, sel__accessibilityLoadAccessibilityInformation);
  AXPerformSafeBlock();
}

uint64_t __87__MPRecentsTableViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "reloadDataSource");
}

@end
