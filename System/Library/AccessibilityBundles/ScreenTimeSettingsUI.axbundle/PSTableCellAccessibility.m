@implementation PSTableCellAccessibility

uint64_t __76__PSTableCellAccessibility__ScreenTimeUI__Preferences_accessibilityActivate__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "sendActionsForControlEvents:", 64);
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
  return result;
}

void __76__PSTableCellAccessibility__ScreenTimeUI__Preferences_accessibilityActivate__block_invoke_2(uint64_t a1)
{
  void (**v2)(_QWORD, _QWORD, _QWORD, _QWORD);
  uint64_t v3;
  uint64_t v4;
  _QWORD v5[5];

  objc_msgSend(*(id *)(a1 + 32), "handler");
  v2 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __76__PSTableCellAccessibility__ScreenTimeUI__Preferences_accessibilityActivate__block_invoke_3;
  v5[3] = &unk_2503362A0;
  v5[4] = *(_QWORD *)(a1 + 48);
  ((void (**)(_QWORD, uint64_t, uint64_t, _QWORD *))v2)[2](v2, v3, v4, v5);

}

uint64_t __76__PSTableCellAccessibility__ScreenTimeUI__Preferences_accessibilityActivate__block_invoke_3(uint64_t result, char a2)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = a2;
  return result;
}

@end
