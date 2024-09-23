@implementation EKEventDetailAttendeesCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("EKEventDetailAttendeesCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("EKEventDetailAttendeesListView"), CFSTR("_inviteeNames"), "NSMutableArray");
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("EKEventDetailAttendeesCell"), CFSTR("_attendeesListView"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("EKEventDetailAttendeesListView"), CFSTR("groupsNames"), "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("EKEventDetailAttendeesCell"), CFSTR("_titleLabel"), "UILabel");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("EKEventDetailAttendeesCell"), CFSTR("_countLabel"), "UILabel");

}

- (id)_axStringForParticipants:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v17;
  void *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (!v4)
  {
    v6 = 0;
    goto LABEL_21;
  }
  v5 = v4;
  v6 = 0;
  v7 = *(_QWORD *)v20;
  do
  {
    v8 = 0;
    do
    {
      if (*(_QWORD *)v20 != v7)
        objc_enumerationMutation(v3);
      v9 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * v8);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v9, "name");
        v10 = objc_claimAutoreleasedReturnValue();
LABEL_10:
        v11 = (void *)v10;
        __UIAXStringForVariables();
        v12 = objc_claimAutoreleasedReturnValue();

        v6 = (void *)v12;
        goto LABEL_11;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v9, "string");
        v10 = objc_claimAutoreleasedReturnValue();
        goto LABEL_10;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v9, "displayString");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "string");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        __UIAXStringForVariables();
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend(v9, "isOptionalParticipant", v17, CFSTR("__AXStringForVariablesSentinel")))
        {
          accessibilityLocalizedString(CFSTR("optional.attendee"));
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          __UIAXStringForVariables();
          v6 = (void *)objc_claimAutoreleasedReturnValue();

        }
        else
        {
          v6 = v14;
        }
      }
      else
      {
        _AXAssert();
      }
LABEL_11:
      ++v8;
    }
    while (v5 != v8);
    v15 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    v5 = v15;
  }
  while (v15);
LABEL_21:

  return v6;
}

- (id)accessibilityLabel
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v8;

  -[EKEventDetailAttendeesCellAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("_titleLabel"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "accessibilityLabel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKEventDetailAttendeesCellAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("_countLabel"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "accessibilityLabel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAXStringForVariables();
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)accessibilityValue
{
  void *v3;
  void *v4;
  int v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  id v26;
  id v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  id v33;
  id v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  uint64_t v39;
  void *v41;
  uint64_t v42;
  uint64_t *v43;
  uint64_t v44;
  uint64_t (*v45)(uint64_t, uint64_t);
  void (*v46)(uint64_t);
  id v47;
  char v48;

  -[EKEventDetailAttendeesCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_attendeesListView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safeValueForKey:", CFSTR("groupsNames"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "BOOLValue");

  if (v5)
  {
    LOBYTE(v42) = 0;
    objc_msgSend(v3, "safeValueForKey:", CFSTR("_inviteeNames"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    __UIAccessibilitySafeClass();
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v48 = 0;
    v42 = 0;
    v43 = &v42;
    v44 = 0x3032000000;
    v45 = __Block_byref_object_copy_;
    v46 = __Block_byref_object_dispose_;
    v47 = 0;
    v8 = v7;
    AXPerformSafeBlock();
    v9 = (id)v43[5];

    _Block_object_dispose(&v42, 8);
    __UIAccessibilitySafeClass();
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v48)
      goto LABEL_22;
    v41 = v3;
    if (objc_msgSend(v10, "count"))
    {
      MobileCalAXLocalizedString(CFSTR("invite.attending"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[EKEventDetailAttendeesCellAccessibility _axStringForParticipants:](self, "_axStringForParticipants:", v10);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      __UIAXStringForVariables();
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      __UIAXStringForVariables();
      v14 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v14 = 0;
    }
    v48 = 0;
    v42 = 0;
    v43 = &v42;
    v44 = 0x3032000000;
    v45 = __Block_byref_object_copy_;
    v46 = __Block_byref_object_dispose_;
    v47 = 0;
    v19 = v8;
    AXPerformSafeBlock();
    v20 = (id)v43[5];

    _Block_object_dispose(&v42, 8);
    __UIAccessibilitySafeClass();
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    if (v48)
      goto LABEL_22;
    if (objc_msgSend(v21, "count"))
    {
      MobileCalAXLocalizedString(CFSTR("invite.tentative"));
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[EKEventDetailAttendeesCellAccessibility _axStringForParticipants:](self, "_axStringForParticipants:", v21);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      __UIAXStringForVariables();
      v24 = (void *)objc_claimAutoreleasedReturnValue();

      __UIAXStringForVariables();
      v25 = objc_claimAutoreleasedReturnValue();

      v14 = (void *)v25;
    }
    v48 = 0;
    v42 = 0;
    v43 = &v42;
    v44 = 0x3032000000;
    v45 = __Block_byref_object_copy_;
    v46 = __Block_byref_object_dispose_;
    v47 = 0;
    v26 = v19;
    AXPerformSafeBlock();
    v27 = (id)v43[5];

    _Block_object_dispose(&v42, 8);
    __UIAccessibilitySafeClass();
    v28 = (void *)objc_claimAutoreleasedReturnValue();

    if (v48)
      goto LABEL_22;
    if (objc_msgSend(v28, "count"))
    {
      MobileCalAXLocalizedString(CFSTR("invite.declined"));
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      -[EKEventDetailAttendeesCellAccessibility _axStringForParticipants:](self, "_axStringForParticipants:", v28);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      __UIAXStringForVariables();
      v31 = (void *)objc_claimAutoreleasedReturnValue();

      __UIAXStringForVariables();
      v32 = objc_claimAutoreleasedReturnValue();

      v14 = (void *)v32;
    }
    v48 = 0;
    v42 = 0;
    v43 = &v42;
    v44 = 0x3032000000;
    v45 = __Block_byref_object_copy_;
    v46 = __Block_byref_object_dispose_;
    v47 = 0;
    v33 = v26;
    AXPerformSafeBlock();
    v34 = (id)v43[5];

    _Block_object_dispose(&v42, 8);
    __UIAccessibilitySafeClass();
    v35 = (void *)objc_claimAutoreleasedReturnValue();

    if (v48)
LABEL_22:
      abort();
    if (objc_msgSend(v35, "count"))
    {
      MobileCalAXLocalizedString(CFSTR("invite.pending"));
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      -[EKEventDetailAttendeesCellAccessibility _axStringForParticipants:](self, "_axStringForParticipants:", v35);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      __UIAXStringForVariables();
      v38 = (void *)objc_claimAutoreleasedReturnValue();

      __UIAXStringForVariables();
      v39 = objc_claimAutoreleasedReturnValue();

      v14 = (void *)v39;
    }

    v3 = v41;
  }
  else
  {
    objc_msgSend(v3, "safeValueForKey:", CFSTR("_ungrouped"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v15, "count"))
    {
      accessibilityLocalizedString(CFSTR("invited.status"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[EKEventDetailAttendeesCellAccessibility _axStringForParticipants:](self, "_axStringForParticipants:", v15);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      __UIAXStringForVariables();
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      __UIAXStringForVariables();
      v14 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v14 = 0;
    }

  }
  return v14;
}

void __61__EKEventDetailAttendeesCellAccessibility_accessibilityValue__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "objectAtIndex:", 0);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __61__EKEventDetailAttendeesCellAccessibility_accessibilityValue__block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "objectAtIndex:", 1);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __61__EKEventDetailAttendeesCellAccessibility_accessibilityValue__block_invoke_3(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "objectAtIndex:", 2);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __61__EKEventDetailAttendeesCellAccessibility_accessibilityValue__block_invoke_4(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "objectAtIndex:", 3);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

@end
