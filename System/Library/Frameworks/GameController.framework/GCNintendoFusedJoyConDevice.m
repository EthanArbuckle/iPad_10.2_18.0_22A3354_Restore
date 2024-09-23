@implementation GCNintendoFusedJoyConDevice

void __59___GCNintendoFusedJoyConDevice_initWithLeft_right_manager___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_refreshBattery");
  objc_msgSend(WeakRetained, "_propagateBattery");

}

void __59___GCNintendoFusedJoyConDevice_initWithLeft_right_manager___block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_refreshBattery");
  objc_msgSend(WeakRetained, "_propagateBattery");

}

void __51___GCNintendoFusedJoyConDevice_Client___addClient___block_invoke(uint64_t a1)
{
  id v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_removeClient:", v2);

}

@end
