@implementation BSUIMapServiceTicket

void __43___BSUIMapServiceTicket_submitWithHandler___block_invoke(uint64_t a1, id a2, void *a3)
{
  void *v5;
  id v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;

  v8 = a3;
  if (a2)
  {
    v5 = (void *)MEMORY[0x24BDBCEB8];
    v6 = a2;
    objc_msgSend(v5, "array");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __43___BSUIMapServiceTicket_submitWithHandler___block_invoke_2;
    v9[3] = &unk_24FE17948;
    a2 = v7;
    v10 = a2;
    objc_msgSend(v6, "enumerateObjectsUsingBlock:", v9);

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void __43___BSUIMapServiceTicket_submitWithHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  id *v4;

  v3 = a2;
  v4 = -[BSUIMapItem initWithMKMapItem:]((id *)[BSUIMapItem alloc], v3);

  objc_msgSend(*(id *)(a1 + 32), "addObject:", v4);
}

@end
