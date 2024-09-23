@implementation VTUIVoiceSelectionOptionsViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("VTUIVoiceSelectionOptionsView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("VTUIVoiceSelectionOptionsView"), CFSTR("_tableCellForVoiceViewModel:indexPath:"), "@", "@", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("VTUIVoiceSelectionOptionsView"), CFSTR("tableView:didSelectRowAtIndexPath:"), "v", "@", "@", 0);

}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  objc_super v8;

  v6 = a4;
  v7 = a3;
  UIAccessibilitySpeak();
  v8.receiver = self;
  v8.super_class = (Class)VTUIVoiceSelectionOptionsViewAccessibility;
  -[VTUIVoiceSelectionOptionsViewAccessibility tableView:didSelectRowAtIndexPath:](&v8, sel_tableView_didSelectRowAtIndexPath_, v7, v6);

}

- (id)_tableCellForVoiceViewModel:(id)a3 indexPath:(id)a4
{
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)VTUIVoiceSelectionOptionsViewAccessibility;
  -[VTUIVoiceSelectionOptionsViewAccessibility _tableCellForVoiceViewModel:indexPath:](&v6, sel__tableCellForVoiceViewModel_indexPath_, a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_setAccessibilityAdditionalTraitsBlock:", &__block_literal_global_0);
  return v4;
}

uint64_t __84__VTUIVoiceSelectionOptionsViewAccessibility__tableCellForVoiceViewModel_indexPath___block_invoke()
{
  return *MEMORY[0x24BDF73F0] | *MEMORY[0x24BDF7408];
}

@end
