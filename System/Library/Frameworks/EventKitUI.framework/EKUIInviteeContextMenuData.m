@implementation EKUIInviteeContextMenuData

- (EKUIInviteeContextMenuData)initWithDefaultActionsForSection:(id)a3 indexPath:(id)a4 participant:(id)a5 interaction:(id)a6 participantSetRole:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  EKUIInviteeContextMenuData *v17;
  EKUIInviteeContextMenuData *v18;
  uint64_t v19;
  UIMenu *menu;
  objc_super v22;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v22.receiver = self;
  v22.super_class = (Class)EKUIInviteeContextMenuData;
  v17 = -[EKUIInviteeContextMenuData init](&v22, sel_init);
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_interaction, a6);
    -[EKUIInviteeContextMenuData _setupContactsOrbActionControllerForParticipant:](v18, "_setupContactsOrbActionControllerForParticipant:", v14);
    -[EKUIInviteeContextMenuData _setupCalendarMenuForSection:indexPath:participant:participantSetRole:](v18, "_setupCalendarMenuForSection:indexPath:participant:participantSetRole:", v12, v13, v14, v16);
    -[EKUIInviteeContextMenuData _buildCombinedCalendarAndContactsMenu](v18, "_buildCombinedCalendarAndContactsMenu");
    v19 = objc_claimAutoreleasedReturnValue();
    menu = v18->_menu;
    v18->_menu = (UIMenu *)v19;

  }
  return v18;
}

- (id)_buildCombinedCalendarAndContactsMenu
{
  void *v3;
  void *v4;
  void *v5;

  -[EKUIInviteeContextMenuData _contactsMenu](self, "_contactsMenu");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v3, "count")+ -[NSArray count](self->_calendarMenuStartItems, "count")+ -[NSArray count](self->_calendarMenuEndItems, "count"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObjectsFromArray:", self->_calendarMenuStartItems);
  objc_msgSend(v4, "addObjectsFromArray:", v3);
  objc_msgSend(v4, "addObjectsFromArray:", self->_calendarMenuEndItems);
  objc_msgSend(MEMORY[0x1E0DC39D0], "menuWithChildren:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)_setupContactsOrbActionControllerForParticipant:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  CNContactOrbActionsController *contactActionsController;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)EKWeakLinkClass();
  objc_msgSend(v5, "descriptorForRequiredKeys");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[EKIdentityViewController contactForIdentity:keysToFetch:](EKIdentityViewController, "contactForIdentity:keysToFetch:", v4, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (void *)objc_msgSend(objc_alloc((Class)v5), "initWithContact:", v8);
  objc_msgSend(v9, "setDelegate:", self);
  contactActionsController = self->_contactActionsController;
  self->_contactActionsController = (CNContactOrbActionsController *)v9;

}

- (void)_setupCalendarMenuForSection:(id)a3 indexPath:(id)a4 participant:(id)a5 participantSetRole:(id)a6
{
  id v9;
  id v10;
  id v11;
  NSArray *v12;
  NSArray *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  id *v27;
  id v28;
  void *v29;
  id *v30;
  _QWORD *v31;
  id v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  NSArray *calendarMenuStartItems;
  NSArray *v39;
  NSArray *calendarMenuEndItems;
  NSArray *v41;
  void *v42;
  id *v43;
  void *v44;
  id v45;
  id v47;
  _QWORD v48[4];
  id v49;
  id v50;
  _QWORD v51[4];
  id v52;
  id v53;
  id v54;
  _QWORD v55[4];
  id v56;
  id v57;
  id v58;
  _QWORD v59[4];
  id v60;
  id v61;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v47 = a6;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v12 = (NSArray *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v13 = (NSArray *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)MEMORY[0x1E0DC3428];
  EventKitUIBundle();
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "localizedStringForKey:value:table:", CFSTR("View Contact"), &stru_1E601DFA8, 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("person.crop.circle"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v59[0] = MEMORY[0x1E0C809B0];
  v59[1] = 3221225472;
  v59[2] = __100__EKUIInviteeContextMenuData__setupCalendarMenuForSection_indexPath_participant_participantSetRole___block_invoke;
  v59[3] = &unk_1E6018F28;
  v18 = v9;
  v60 = v18;
  v19 = v10;
  v61 = v19;
  objc_msgSend(v14, "actionWithTitle:image:identifier:handler:", v16, v17, 0, v59);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  -[NSArray addObject:](v12, "addObject:", v20);
  if (objc_msgSend(v18, "canEditRow:", v19))
  {
    v44 = v20;
    v21 = objc_msgSend(v11, "participantRole");
    EventKitUIBundle();
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = v22;
    v45 = v11;
    if (v21 == 2)
    {
      objc_msgSend(v22, "localizedStringForKey:value:table:", CFSTR("Make Required"), &stru_1E601DFA8, 0);
      v24 = objc_claimAutoreleasedReturnValue();

      v42 = (void *)MEMORY[0x1E0DC3428];
      objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("person.fill.checkmark"));
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = MEMORY[0x1E0C809B0];
      v55[0] = MEMORY[0x1E0C809B0];
      v55[1] = 3221225472;
      v55[2] = __100__EKUIInviteeContextMenuData__setupCalendarMenuForSection_indexPath_participant_participantSetRole___block_invoke_2;
      v55[3] = &unk_1E6018F50;
      v43 = &v58;
      v58 = v47;
      v27 = &v56;
      v28 = v11;
      v29 = (void *)v24;
      v56 = v28;
      v30 = &v57;
      v57 = v19;
      v31 = v55;
    }
    else
    {
      objc_msgSend(v22, "localizedStringForKey:value:table:", CFSTR("Make Optional"), &stru_1E601DFA8, 0);
      v24 = objc_claimAutoreleasedReturnValue();

      v42 = (void *)MEMORY[0x1E0DC3428];
      objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("person.fill.questionmark"));
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = MEMORY[0x1E0C809B0];
      v51[0] = MEMORY[0x1E0C809B0];
      v51[1] = 3221225472;
      v51[2] = __100__EKUIInviteeContextMenuData__setupCalendarMenuForSection_indexPath_participant_participantSetRole___block_invoke_3;
      v51[3] = &unk_1E6018F50;
      v43 = &v54;
      v54 = v47;
      v27 = &v52;
      v32 = v11;
      v29 = (void *)v24;
      v52 = v32;
      v30 = &v53;
      v53 = v19;
      v31 = v51;
    }
    objc_msgSend(v42, "actionWithTitle:image:identifier:handler:", v24, v25, 0, v31);
    v33 = (void *)objc_claimAutoreleasedReturnValue();

    -[NSArray addObject:](v12, "addObject:", v33);
    v34 = (void *)MEMORY[0x1E0DC3428];
    objc_msgSend(v18, "titleForDeleteConfirmationButtonForRow:", v19);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("trash"));
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v48[0] = v26;
    v48[1] = 3221225472;
    v48[2] = __100__EKUIInviteeContextMenuData__setupCalendarMenuForSection_indexPath_participant_participantSetRole___block_invoke_4;
    v48[3] = &unk_1E6018F28;
    v49 = v18;
    v50 = v19;
    objc_msgSend(v34, "actionWithTitle:image:identifier:handler:", v35, v36, 0, v48);
    v37 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v37, "setAttributes:", 2);
    -[NSArray addObject:](v13, "addObject:", v37);

    v20 = v44;
    v11 = v45;
  }
  calendarMenuStartItems = self->_calendarMenuStartItems;
  self->_calendarMenuStartItems = v12;
  v39 = v12;

  calendarMenuEndItems = self->_calendarMenuEndItems;
  self->_calendarMenuEndItems = v13;
  v41 = v13;

}

uint64_t __100__EKUIInviteeContextMenuData__setupCalendarMenuForSection_indexPath_participant_participantSetRole___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "selectRow:", *(_QWORD *)(a1 + 40));
}

void __100__EKUIInviteeContextMenuData__setupCalendarMenuForSection_indexPath_participant_participantSetRole___block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  id v3;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(_QWORD *)(a1 + 48);
  objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndex:", objc_msgSend(*(id *)(a1 + 40), "section"));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, uint64_t, uint64_t, id))(v2 + 16))(v2, v1, 1, v3);

}

void __100__EKUIInviteeContextMenuData__setupCalendarMenuForSection_indexPath_participant_participantSetRole___block_invoke_3(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  id v3;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(_QWORD *)(a1 + 48);
  objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndex:", objc_msgSend(*(id *)(a1 + 40), "section"));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, uint64_t, uint64_t, id))(v2 + 16))(v2, v1, 2, v3);

}

uint64_t __100__EKUIInviteeContextMenuData__setupCalendarMenuForSection_indexPath_participant_participantSetRole___block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "commitEditingStyle:forRow:", 1, *(_QWORD *)(a1 + 40));
}

- (id)_contactsMenu
{
  return (id)-[CNContactOrbActionsController currentAvailableMenuItems](self->_contactActionsController, "currentAvailableMenuItems");
}

- (void)contactOrbActionsController:(id)a3 didUpdateWithMenu:(id)a4
{
  UIMenu *v5;
  UIMenu *menu;
  UIContextMenuInteraction *interaction;
  _QWORD v8[5];

  -[EKUIInviteeContextMenuData _buildCombinedCalendarAndContactsMenu](self, "_buildCombinedCalendarAndContactsMenu", a3, a4);
  v5 = (UIMenu *)objc_claimAutoreleasedReturnValue();
  menu = self->_menu;
  self->_menu = v5;

  interaction = self->_interaction;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __76__EKUIInviteeContextMenuData_contactOrbActionsController_didUpdateWithMenu___block_invoke;
  v8[3] = &unk_1E6018F78;
  v8[4] = self;
  -[UIContextMenuInteraction updateVisibleMenuWithBlock:](interaction, "updateVisibleMenuWithBlock:", v8);
}

id __76__EKUIInviteeContextMenuData_contactOrbActionsController_didUpdateWithMenu___block_invoke(uint64_t a1)
{
  return *(id *)(*(_QWORD *)(a1 + 32) + 40);
}

- (id)presentingViewControllerForActionsController:(id)a3
{
  return 0;
}

- (UIMenu)menu
{
  return self->_menu;
}

- (void)setMenu:(id)a3
{
  objc_storeStrong((id *)&self->_menu, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_menu, 0);
  objc_storeStrong((id *)&self->_contactActionsController, 0);
  objc_storeStrong((id *)&self->_interaction, 0);
  objc_storeStrong((id *)&self->_calendarMenuEndItems, 0);
  objc_storeStrong((id *)&self->_calendarMenuStartItems, 0);
}

@end
