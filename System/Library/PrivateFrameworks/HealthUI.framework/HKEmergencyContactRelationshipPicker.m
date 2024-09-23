@implementation HKEmergencyContactRelationshipPicker

- (HKEmergencyContactRelationshipPicker)init
{
  HKEmergencyContactRelationshipPicker *v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
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
  NSArray *v27;
  NSArray *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  NSArray *tokens;
  NSArray *v34;
  NSArray *labels;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  objc_super v41;
  _QWORD v42[5];
  uint64_t v43;
  uint64_t *v44;
  uint64_t v45;
  uint64_t v46;
  _BYTE v47[128];
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v41.receiver = self;
  v41.super_class = (Class)HKEmergencyContactRelationshipPicker;
  v2 = -[HKTableViewController init](&v41, sel_init);
  if (v2)
  {
    v43 = 0;
    v44 = &v43;
    v45 = 0x2050000000;
    v3 = (void *)getCNLabeledValueClass_softClass;
    v46 = getCNLabeledValueClass_softClass;
    if (!getCNLabeledValueClass_softClass)
    {
      v42[0] = MEMORY[0x1E0C809B0];
      v42[1] = 3221225472;
      v42[2] = __getCNLabeledValueClass_block_invoke;
      v42[3] = &unk_1E9C3FDF8;
      v42[4] = &v43;
      __getCNLabeledValueClass_block_invoke((uint64_t)v42);
      v3 = (void *)v44[3];
    }
    v4 = objc_retainAutorelease(v3);
    _Block_object_dispose(&v43, 8);
    objc_msgSend(v4, "builtinLabelsForProperty:", *MEMORY[0x1E0C96840]);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(v5, "mutableCopy");

    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("relationship_roommate"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObject:", v8);

    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("relationship_doctor"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObject:", v10);

    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("relationship_emergency"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObject:", v12);

    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("relationship_family_member"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable-tinker"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObject:", v14);

    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "localizedStringForKey:value:table:", CFSTR("relationship_teacher"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable-tinker"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObject:", v16);

    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "localizedStringForKey:value:table:", CFSTR("relationship_caretaker"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable-tinker"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObject:", v18);

    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "localizedStringForKey:value:table:", CFSTR("relationship_guardian"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable-tinker"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObject:", v20);

    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "localizedStringForKey:value:table:", CFSTR("relationship_social_worker"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable-tinker"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObject:", v22);

    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "localizedStringForKey:value:table:", CFSTR("relationship_school"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable-tinker"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObject:", v24);

    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "localizedStringForKey:value:table:", CFSTR("relationship_daycare"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable-tinker"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObject:", v26);

    v27 = (NSArray *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v6, "count"));
    v39 = 0u;
    v40 = 0u;
    v37 = 0u;
    v38 = 0u;
    v28 = v6;
    v29 = -[NSArray countByEnumeratingWithState:objects:count:](v28, "countByEnumeratingWithState:objects:count:", &v37, v47, 16);
    if (v29)
    {
      v30 = *(_QWORD *)v38;
      do
      {
        v31 = 0;
        do
        {
          if (*(_QWORD *)v38 != v30)
            objc_enumerationMutation(v28);
          objc_msgSend(v4, "localizedStringForLabel:", *(_QWORD *)(*((_QWORD *)&v37 + 1) + 8 * v31), (_QWORD)v37);
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSArray addObject:](v27, "addObject:", v32);

          ++v31;
        }
        while (v29 != v31);
        v29 = -[NSArray countByEnumeratingWithState:objects:count:](v28, "countByEnumeratingWithState:objects:count:", &v37, v47, 16);
      }
      while (v29);
    }

    tokens = v2->_tokens;
    v2->_tokens = v28;
    v34 = v28;

    labels = v2->_labels;
    v2->_labels = v27;

  }
  return v2;
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)HKEmergencyContactRelationshipPicker;
  -[HKTableViewController viewDidLoad](&v8, sel_viewDidLoad);
  -[HKEmergencyContactRelationshipPicker tableView](self, "tableView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setEstimatedRowHeight:", 44.0);

  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithBarButtonSystemItem:target:action:", 1, self, sel__cancelTapped_);
  -[HKEmergencyContactRelationshipPicker navigationItem](self, "navigationItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setLeftBarButtonItem:", v4);

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("emergency_contact_relationship"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKEmergencyContactRelationshipPicker setTitle:](self, "setTitle:", v7);

}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 1;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return -[NSArray count](self->_labels, "count", a3, a4);
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v6 = a4;
  objc_msgSend(a3, "dequeueReusableCellWithIdentifier:", CFSTR("reuseIdentifier"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D50]), "initWithStyle:reuseIdentifier:", 0, CFSTR("reuseIdentifier"));
  -[NSArray objectAtIndexedSubscript:](self->_labels, "objectAtIndexedSubscript:", objc_msgSend(v6, "row"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "textLabel");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setText:", v8);

  return v7;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  HKEmergencyContactRelationshipPickerDelegate **p_delegate;
  id v6;
  NSArray *tokens;
  uint64_t v8;
  void *v9;
  id WeakRetained;

  p_delegate = &self->_delegate;
  v6 = a4;
  WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  tokens = self->_tokens;
  v8 = objc_msgSend(v6, "row");

  -[NSArray objectAtIndexedSubscript:](tokens, "objectAtIndexedSubscript:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "emergencyContactRelationshipPicker:didChooseRelationshipNamed:", self, v9);

}

- (void)_cancelTapped:(id)a3
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "emergencyContactRelationshipPickerDidCancel:", self);

}

- (HKEmergencyContactRelationshipPickerDelegate)delegate
{
  return (HKEmergencyContactRelationshipPickerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_labels, 0);
  objc_storeStrong((id *)&self->_tokens, 0);
}

@end
