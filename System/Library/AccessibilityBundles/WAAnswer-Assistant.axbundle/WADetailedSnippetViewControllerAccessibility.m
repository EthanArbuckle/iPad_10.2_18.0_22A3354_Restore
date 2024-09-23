@implementation WADetailedSnippetViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("WADetailedSnippetViewController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)_accessibilityLabelForAnswerAtIndex:(unint64_t)a3
{
  void *v4;
  void *v5;
  id v6;
  _QWORD v8[7];
  _QWORD v9[4];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  id v15;

  v10 = 0;
  v11 = &v10;
  v12 = 0x3032000000;
  v13 = __Block_byref_object_copy_;
  v14 = __Block_byref_object_dispose_;
  v15 = 0;
  -[WADetailedSnippetViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("snippet"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = 0;
  v9[1] = v9;
  v9[2] = 0x2020000000;
  v9[3] = 0;
  objc_msgSend(v4, "safeValueForKey:", CFSTR("answers"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __84__WADetailedSnippetViewControllerAccessibility__accessibilityLabelForAnswerAtIndex___block_invoke;
    v8[3] = &unk_2503E2590;
    v8[4] = v9;
    v8[5] = &v10;
    v8[6] = a3;
    objc_msgSend(v5, "enumerateObjectsUsingBlock:", v8);
  }
  v6 = (id)v11[5];

  _Block_object_dispose(v9, 8);
  _Block_object_dispose(&v10, 8);

  return v6;
}

void __84__WADetailedSnippetViewControllerAccessibility__accessibilityLabelForAnswerAtIndex___block_invoke(_QWORD *a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  id v14;
  _QWORD v15[4];
  __int128 v16;
  uint64_t v17;
  _BYTE *v18;

  v6 = a2;
  v7 = *(_QWORD *)(a1[4] + 8);
  v8 = *(_QWORD *)(v7 + 24);
  v14 = v6;
  if (a1[6] == v8)
  {
    objc_msgSend(v6, "safeValueForKey:", CFSTR("title"));
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = *(_QWORD *)(a1[5] + 8);
    v11 = *(void **)(v10 + 40);
    *(_QWORD *)(v10 + 40) = v9;

    v6 = v14;
    *a4 = 1;
    v7 = *(_QWORD *)(a1[4] + 8);
    v8 = *(_QWORD *)(v7 + 24);
  }
  *(_QWORD *)(v7 + 24) = v8 + 1;
  objc_msgSend(v6, "safeValueForKey:", CFSTR("lines"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v15[0] = MEMORY[0x24BDAC760];
    v15[1] = 3221225472;
    v15[2] = __84__WADetailedSnippetViewControllerAccessibility__accessibilityLabelForAnswerAtIndex___block_invoke_2;
    v15[3] = &unk_2503E2568;
    v13 = a1[6];
    v16 = *((_OWORD *)a1 + 2);
    v17 = v13;
    v18 = a4;
    objc_msgSend(v12, "enumerateObjectsUsingBlock:", v15);
  }

}

void __84__WADetailedSnippetViewControllerAccessibility__accessibilityLabelForAnswerAtIndex___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v8;
  uint64_t v9;
  void *v10;

  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v5 = *(_QWORD *)(v4 + 24);
  if (*(_QWORD *)(a1 + 48) == v5)
  {
    objc_msgSend(a2, "safeValueForKey:", CFSTR("text"));
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v10 = *(void **)(v9 + 40);
    *(_QWORD *)(v9 + 40) = v8;

    *a4 = 1;
    **(_BYTE **)(a1 + 56) = 1;
    v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v5 = *(_QWORD *)(v4 + 24);
  }
  *(_QWORD *)(v4 + 24) = v5 + 1;
}

- (void)loadView
{
  void *v3;
  _QWORD v4[5];
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)WADetailedSnippetViewControllerAccessibility;
  -[WADetailedSnippetViewControllerAccessibility loadView](&v5, sel_loadView);
  -[WADetailedSnippetViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_answerViews"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __56__WADetailedSnippetViewControllerAccessibility_loadView__block_invoke;
  v4[3] = &unk_2503E25B8;
  v4[4] = self;
  objc_msgSend(v3, "enumerateObjectsUsingBlock:", v4);

}

void __56__WADetailedSnippetViewControllerAccessibility_loadView__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  id v6;

  v5 = a2;
  objc_msgSend(v5, "setIsAccessibilityElement:", 1);
  objc_msgSend(*(id *)(a1 + 32), "_accessibilityLabelForAnswerAtIndex:", a3);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAccessibilityLabel:", v6);

}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  _QWORD *v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)WADetailedSnippetViewControllerAccessibility;
  v6 = a4;
  -[WADetailedSnippetViewControllerAccessibility collectionView:cellForItemAtIndexPath:](&v12, sel_collectionView_cellForItemAtIndexPath_, a3, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setIsAccessibilityElement:", 1, v12.receiver, v12.super_class);
  v8 = objc_msgSend(v6, "row");

  -[WADetailedSnippetViewControllerAccessibility _accessibilityLabelForAnswerAtIndex:](self, "_accessibilityLabelForAnswerAtIndex:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setAccessibilityLabel:", v9);
  NSClassFromString(CFSTR("WATextHeaderView"));
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v10 = (_QWORD *)MEMORY[0x24BDF73C0];
LABEL_3:
    objc_msgSend(v7, "setAccessibilityTraits:", *v10);
    goto LABEL_6;
  }
  NSClassFromString(CFSTR("WAImageView"));
  if ((objc_opt_isKindOfClass() & 1) != 0 && !objc_msgSend(v9, "length"))
  {
    v10 = (_QWORD *)MEMORY[0x24BDF73C8];
    goto LABEL_3;
  }
LABEL_6:

  return v7;
}

@end
