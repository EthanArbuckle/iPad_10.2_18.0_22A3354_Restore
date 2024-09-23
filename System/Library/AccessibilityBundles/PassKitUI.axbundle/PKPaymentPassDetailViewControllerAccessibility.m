@implementation PKPaymentPassDetailViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("PKPaymentPassDetailViewController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("PKPaymentPassDetailViewController"), CFSTR("PKDynamicTableViewController"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PKPassField"), CFSTR("value"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("PKPaymentPassDetailViewController"), CFSTR("_logoView"), "UIImageView");
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PKDynamicTableViewController"), CFSTR("indexOfSectionIdentifier:"), "q", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PKPaymentPassDetailViewController"), CFSTR("_cardInfoSectionGenerateCellWithOutput:forRowIndex:tableView:"), "Q", "^@", "q", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PKPaymentPassDetailViewController"), CFSTR("_linkCellWithText:forTableView:"), "@", "@", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PKPaymentPassDetailViewController"), CFSTR("_infoCellWithDescription:forTableView:"), "@", "@", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PKPaymentPassDetailViewController"), CFSTR("viewDidLayoutSubviews"), "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PKSectionTableViewController"), CFSTR("shouldMapSection:"), "B", "Q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PKPass"), CFSTR("fieldForKey:"), "@", "@", 0);

}

- (void)_accessibilityLoadAccessibilityInformation
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PKPaymentPassDetailViewControllerAccessibility;
  -[PKPaymentPassDetailViewControllerAccessibility _accessibilityLoadAccessibilityInformation](&v3, sel__accessibilityLoadAccessibilityInformation);
  -[PKPaymentPassDetailViewControllerAccessibility _axLabelIssuerLogo](self, "_axLabelIssuerLogo");
}

- (void)_axLoadAccessibilityInformationForCell:(id)a3 atIndexPath:(id)a4
{
  id v5;
  id v6;
  id v7;
  void *v8;
  id v9;
  _QWORD v10[4];

  v5 = a3;
  v10[0] = 0;
  v10[1] = v10;
  v10[2] = 0x2020000000;
  v10[3] = 0;
  v9 = a4;
  AXPerformSafeBlock();

  _Block_object_dispose(v10, 8);
  v8 = v5;
  v6 = v5;
  v7 = v9;
  AXPerformSafeBlock();

}

void __101__PKPaymentPassDetailViewControllerAccessibility__axLoadAccessibilityInformationForCell_atIndexPath___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(*(id *)(a1 + 40), "section"));
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringValue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = objc_msgSend(v2, "indexOfSectionIdentifier:", v3);

}

void __101__PKPaymentPassDetailViewControllerAccessibility__axLoadAccessibilityInformationForCell_atIndexPath___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  int v3;
  int v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t (*v7)(uint64_t);
  void *v8;
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t);
  void *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  char v20;

  v2 = *(_QWORD *)(a1 + 56);
  if (v2 == 33)
  {
    v17 = 0;
    v18 = &v17;
    v19 = 0x2020000000;
    v20 = 0;
    v11 = MEMORY[0x24BDAC760];
    v12 = 3221225472;
    v13 = __101__PKPaymentPassDetailViewControllerAccessibility__axLoadAccessibilityInformationForCell_atIndexPath___block_invoke_3;
    v14 = &unk_2502E3A98;
    v15 = *(_QWORD *)(a1 + 32);
    v16 = &v17;
    AXPerformSafeBlock();
    v3 = *((unsigned __int8 *)v18 + 24);
    _Block_object_dispose(&v17, 8);
    if (v3)
    {
      if (objc_msgSend(*(id *)(a1 + 40), "row") != 1)
        return;
LABEL_8:
      objc_msgSend(*(id *)(a1 + 32), "_axSetSanitizedLabelForCell:", *(_QWORD *)(a1 + 48), v5, v6, v7, v8, v9, v10, v11, v12, v13, v14, v15, v16);
      return;
    }
    v2 = *(_QWORD *)(a1 + 56);
  }
  if (v2 == 34)
  {
    v17 = 0;
    v18 = &v17;
    v19 = 0x2020000000;
    v20 = 0;
    v5 = MEMORY[0x24BDAC760];
    v6 = 3221225472;
    v7 = __101__PKPaymentPassDetailViewControllerAccessibility__axLoadAccessibilityInformationForCell_atIndexPath___block_invoke_4;
    v8 = &unk_2502E3A98;
    v9 = *(_QWORD *)(a1 + 32);
    v10 = &v17;
    AXPerformSafeBlock();
    v4 = *((unsigned __int8 *)v18 + 24);
    _Block_object_dispose(&v17, 8);
    if (v4)
      goto LABEL_8;
  }
}

uint64_t __101__PKPaymentPassDetailViewControllerAccessibility__axLoadAccessibilityInformationForCell_atIndexPath___block_invoke_3(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "shouldMapSection:", 33);
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

uint64_t __101__PKPaymentPassDetailViewControllerAccessibility__axLoadAccessibilityInformationForCell_atIndexPath___block_invoke_4(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "shouldMapSection:", 34);
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (void)_axLabelIssuerLogo
{
  void *v3;
  void *v4;
  id v5;

  accessibilityLocalizedString(CFSTR("issue.name.image"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentPassDetailViewControllerAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("_logoView"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAccessibilityLabel:", v3);

  -[PKPaymentPassDetailViewControllerAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("_logoView"));
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setIsAccessibilityElement:", 1);

}

- (void)viewDidLayoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PKPaymentPassDetailViewControllerAccessibility;
  -[PKPaymentPassDetailViewControllerAccessibility viewDidLayoutSubviews](&v3, sel_viewDidLayoutSubviews);
  -[PKPaymentPassDetailViewControllerAccessibility _axLabelIssuerLogo](self, "_axLabelIssuerLogo");
}

- (id)_linkCellWithText:(id)a3 forTableView:(id)a4
{
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PKPaymentPassDetailViewControllerAccessibility;
  -[PKPaymentPassDetailViewControllerAccessibility _linkCellWithText:forTableView:](&v6, sel__linkCellWithText_forTableView_, a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAccessibilityTraits:", *MEMORY[0x24BDF73B0]);
  return v4;
}

- (unint64_t)_cardInfoSectionGenerateCellWithOutput:(id *)a3 forRowIndex:(int64_t)a4 tableView:(id)a5
{
  id v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)PKPaymentPassDetailViewControllerAccessibility;
  v8 = -[PKPaymentPassDetailViewControllerAccessibility _cardInfoSectionGenerateCellWithOutput:forRowIndex:tableView:](&v10, sel__cardInfoSectionGenerateCellWithOutput_forRowIndex_tableView_, a3, a4, a5);
  if (a3 && !a4)
    -[PKPaymentPassDetailViewControllerAccessibility _axSetSanitizedLabelForCell:](self, "_axSetSanitizedLabelForCell:", *a3);
  return (unint64_t)v8;
}

- (id)_infoCellWithDescription:(id)a3 forTableView:(id)a4
{
  void *v4;
  uint64_t v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PKPaymentPassDetailViewControllerAccessibility;
  -[PKPaymentPassDetailViewControllerAccessibility _infoCellWithDescription:forTableView:](&v7, sel__infoCellWithDescription_forTableView_, a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "accessibilityTraits");
  objc_msgSend(v4, "setAccessibilityTraits:", v5 & ~*MEMORY[0x24BDF73B0]);
  return v4;
}

- (void)_axSetSanitizedLabelForCell:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
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
  id v20;
  _QWORD v21[4];
  id v22;

  v3 = a3;
  NSClassFromString(CFSTR("PKStackedLabelCell"));
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v3, "safeValueForKey:", CFSTR("_detailLabel"));
  else
    objc_msgSend(v3, "detailTextLabel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "safeStringForKey:", CFSTR("text"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  PKPANMask();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "containsString:", v6);

  if (v7)
  {
    objc_msgSend(v4, "safeStringForKey:", CFSTR("text"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD14A8], "decimalDigitCharacterSet");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "invertedSet");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "componentsSeparatedByCharactersInSet:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "componentsJoinedByString:", &stru_2502E3F40);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDD14A8], "controlCharacterSet");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "stringByTrimmingCharactersInSet:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    v15 = (void *)MEMORY[0x24BDFEA60];
    v16 = (void *)MEMORY[0x24BDD17C8];
    accessibilityLocalizedString(CFSTR("ends.with"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "stringWithFormat:", v17, v14);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "axAttributedStringWithString:", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v19, "setAttribute:forKey:", *MEMORY[0x24BDBD270], *MEMORY[0x24BDFEC78]);
    v21[0] = MEMORY[0x24BDAC760];
    v21[1] = 3221225472;
    v21[2] = __78__PKPaymentPassDetailViewControllerAccessibility__axSetSanitizedLabelForCell___block_invoke;
    v21[3] = &unk_2502E3D48;
    v22 = v19;
    v20 = v19;
    objc_msgSend(v4, "_setAccessibilityLabelBlock:", v21);

  }
}

id __78__PKPaymentPassDetailViewControllerAccessibility__axSetSanitizedLabelForCell___block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)PKPaymentPassDetailViewControllerAccessibility;
  v6 = a4;
  -[PKPaymentPassDetailViewControllerAccessibility tableView:cellForRowAtIndexPath:](&v9, sel_tableView_cellForRowAtIndexPath_, a3, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentPassDetailViewControllerAccessibility _axLoadAccessibilityInformationForCell:atIndexPath:](self, "_axLoadAccessibilityInformationForCell:atIndexPath:", v7, v6, v9.receiver, v9.super_class);

  return v7;
}

@end
