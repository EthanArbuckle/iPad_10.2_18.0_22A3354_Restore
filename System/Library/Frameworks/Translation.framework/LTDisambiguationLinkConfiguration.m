@implementation LTDisambiguationLinkConfiguration

uint64_t __47___LTDisambiguationLinkConfiguration_edgeTypes__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(a2, "type"));
}

BOOL __95___LTDisambiguationLinkConfiguration__unvalidatedEdgeFromAdjacencyListMatchingTargetNodeIndex___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  _BOOL8 v4;

  v3 = a2;
  v4 = objc_msgSend(v3, "type") == 1 && objc_msgSend(v3, "targetPhraseIndex") == *(_QWORD *)(a1 + 32);

  return v4;
}

@end
