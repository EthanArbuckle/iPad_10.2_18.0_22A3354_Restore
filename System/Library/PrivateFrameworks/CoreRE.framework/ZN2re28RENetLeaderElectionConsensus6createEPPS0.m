@implementation ZN2re28RENetLeaderElectionConsensus6createEPPS0

re *___ZN2re28RENetLeaderElectionConsensus6createEPPS0__block_invoke(re *result)
{
  uint64_t v1;
  uint64_t v2;
  double v3;

  v1 = *((_QWORD *)result + 4);
  if (v1)
  {
    v2 = re::globalAllocators(result)[2];
    std::unique_ptr<re::RawNode>::reset[abi:nn180100]((re::Raft **)(v1 + 56), 0);
    v3 = re::Queue<re::Message>::deinit((uint64_t *)v1);
    return (re *)(*(uint64_t (**)(uint64_t, uint64_t, double))(*(_QWORD *)v2 + 40))(v2, v1, v3);
  }
  return result;
}

@end
