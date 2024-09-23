@implementation INUICKPEntryPoint

- (void)requestCardSectionViewProviderForCard:(id)a3 delegate:(id)a4 reply:(id)a5
{
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;

  v8 = a5;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __74__INUICKPEntryPoint_requestCardSectionViewProviderForCard_delegate_reply___block_invoke;
  v10[3] = &unk_24EB4F2D8;
  v11 = v8;
  v9 = v8;
  -[INUICKPEntryPoint requestIdentifiedCardSectionViewProviderForCard:delegate:reply:](self, "requestIdentifiedCardSectionViewProviderForCard:delegate:reply:", a3, a4, v10);

}

uint64_t __74__INUICKPEntryPoint_requestCardSectionViewProviderForCard_delegate_reply___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)requestIdentifiedCardSectionViewProviderForCard:(id)a3 delegate:(id)a4 reply:(id)a5
{
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;

  v7 = a5;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __84__INUICKPEntryPoint_requestIdentifiedCardSectionViewProviderForCard_delegate_reply___block_invoke;
  v9[3] = &unk_24EB4F300;
  v10 = v7;
  v8 = v7;
  +[INUICKPCardSectionViewProvider requestInstanceFromDefaultAllocatorWithCard:delegate:reply:](INUICKPCardSectionViewProvider, "requestInstanceFromDefaultAllocatorWithCard:delegate:reply:", a3, a4, v9);

}

uint64_t __84__INUICKPEntryPoint_requestIdentifiedCardSectionViewProviderForCard_delegate_reply___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t))(result + 16))(result, 0, a2);
  return result;
}

- (NSString)providerIdentifier
{
  return (NSString *)CFSTR("com.apple.cards.IntentsUICardKitProvider");
}

@end
