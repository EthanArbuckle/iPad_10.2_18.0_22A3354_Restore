@implementation HKCFGNonTerminal

uint64_t __72___HKCFGNonTerminal__tryNodesForExpressions_nodes_context_solutionTest___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "addObject:", v4);
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = objc_msgSend(*(id *)(a1 + 40), "_tryNodesForExpressions:nodes:context:solutionTest:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64));
  objc_msgSend(*(id *)(a1 + 32), "removeObject:", v4);

  return *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24);
}

uint64_t __55___HKCFGNonTerminal__tryNodesWithContext_solutionTest___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;

  +[_HKCFGNonTerminalNode nodeWithChildren:rule:rangeOfString:](_HKCFGNonTerminalNode, "nodeWithChildren:rule:rangeOfString:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 80), objc_msgSend(*(id *)(a1 + 32), "scanLocation") - *(_QWORD *)(a1 + 80));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 56), "addObject:", v2);
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
  v3 = *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24);

  return v3;
}

uint64_t __43___HKCFGNonTerminal__parseTreeWithContext___block_invoke(uint64_t a1, void *a2)
{
  id v4;
  void *v5;
  uint64_t v6;

  v4 = a2;
  objc_msgSend(*(id *)(a1 + 32), "scanner");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isAtEnd");

  if ((_DWORD)v6)
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);

  return v6;
}

@end
