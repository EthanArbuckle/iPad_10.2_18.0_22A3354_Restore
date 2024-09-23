@implementation AXStocksAssistantUIGlue

+ (void)accessibilityInitializeBundle
{
  void *v2;
  uint64_t v3;
  void *v4;

  if (!_Failover)
  {
    objc_msgSend(MEMORY[0x24BE00758], "sharedInstance");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "performValidations:withPreValidationHandler:postValidationHandler:safeCategoryInstallationHandler:", &__block_literal_global, &__block_literal_global_203, 0, &__block_literal_global_209);

    v3 = objc_msgSend(objc_allocWithZone((Class)AXStocksAssistantUIGlue), "init");
    v4 = (void *)_Failover;
    _Failover = v3;

  }
}

uint64_t __56__AXStocksAssistantUIGlue_accessibilityInitializeBundle__block_invoke(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  objc_msgSend(v2, "validateClass:", CFSTR("StocksAssistantStockListCell"));
  objc_msgSend(v2, "validateClass:", CFSTR("StocksAssistantStockDetailCell"));
  objc_msgSend(v2, "validateClass:hasInstanceVariable:withType:", CFSTR("StocksAssistantStockListCell"), CFSTR("_companyNameLabel"), "UILabel");
  objc_msgSend(v2, "validateClass:hasInstanceVariable:withType:", CFSTR("StocksAssistantStockListCell"), CFSTR("_tickerLabel"), "UILabel");
  objc_msgSend(v2, "validateClass:hasInstanceVariable:withType:", CFSTR("StocksAssistantStockListCell"), CFSTR("_attributeTitle"), "UILabel");
  objc_msgSend(v2, "validateClass:hasInstanceVariable:withType:", CFSTR("StocksAssistantStockListCell"), CFSTR("_attributeValue"), "UILabel");
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("StocksAssistantStockCell"), CFSTR("stock"), "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("Stock"), CFSTR("changeIsNegative"), "B", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("Stock"), CFSTR("formattedChangePercent:"), "@", "B", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("Stock"), CFSTR("formattedPrice"), "@", 0);

  return 1;
}

uint64_t __56__AXStocksAssistantUIGlue_accessibilityInitializeBundle__block_invoke_2(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  objc_msgSend(v2, "setValidationTargetName:", CFSTR("Stocks Assistant UI AX Bundle"));
  objc_msgSend(v2, "setOverrideProcessName:", CFSTR("Stocks Assistant UI"));
  objc_msgSend(v2, "setDebugBuild:", 0);

  return AXPerformValidationChecks();
}

void __56__AXStocksAssistantUIGlue_accessibilityInitializeBundle__block_invoke_3(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("StocksAssistantStockListCellAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("StocksAssistantChartViewAccessibility"), 1);

}

@end
