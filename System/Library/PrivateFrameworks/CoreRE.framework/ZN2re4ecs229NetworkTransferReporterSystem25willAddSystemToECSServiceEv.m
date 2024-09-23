@implementation ZN2re4ecs229NetworkTransferReporterSystem25willAddSystemToECSServiceEv

_DWORD *___ZN2re4ecs229NetworkTransferReporterSystem25willAddSystemToECSServiceEv_block_invoke(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4, unint64_t a5, uint64_t a6, uint64_t a7, unsigned int a8)
{
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  _anonymous_namespace_ *IsLocal;
  uint64_t v18;
  _DWORD *v19;
  uint64_t v21;
  _BYTE v22[44];
  _BYTE v23[20];
  __int128 v24;
  int v25;
  uint64_t v26;
  unint64_t v27;
  uint64_t v28;

  v12 = *(_QWORD *)(a1 + 32);
  v13 = 0x94D049BB133111EBLL
      * ((0xBF58476D1CE4E5B9 * (a3 ^ (a3 >> 30))) ^ ((0xBF58476D1CE4E5B9 * (a3 ^ (a3 >> 30))) >> 27));
  v27 = v13 ^ (v13 >> 31);
  v28 = a4;
  v14 = re::HashTable<re::ecs2::Scene const*,re::DataArray<re::ecs2::PhysicsSimulationData>,re::Hash<re::ecs2::Scene const*>,re::EqualTo<re::ecs2::Scene const*>,true,false>::tryGet(*(_QWORD *)(v12 + 104) + 16, (uint64_t *)&v27);
  if (!v14)
  {
    v15 = *(_QWORD *)(v12 + 104) + 16;
    v16 = v27;
    IsLocal = (_anonymous_namespace_ *)RESyncNetSessionGetIsLocal();
    v21 = v16;
    v22[0] = (_BYTE)IsLocal;
    memset(&v22[8], 0, 36);
    *(_QWORD *)v23 = 0x7FFFFFFFLL;
    v14 = re::HashTable<unsigned long,re::SessionTransferReport,re::Hash<unsigned long>,re::EqualTo<unsigned long>,true,false>::addNew(v15, (uint64_t *)&v27, &v21);
    re::HashTable<unsigned long long,re::PeerTransferReport,re::Hash<unsigned long long>,re::EqualTo<unsigned long long>,true,false>::deinit((uint64_t *)&v22[8]);
  }
  v18 = v14 + 16;
  v19 = (_DWORD *)re::HashTable<unsigned long long,re::PeerTransferReport,re::Hash<unsigned long long>,re::EqualTo<unsigned long long>,true,false>::tryGet(v14 + 16, &v28);
  if (!v19)
  {
    v21 = v28;
    memset(v22, 0, 36);
    *(_QWORD *)&v22[36] = 0x7FFFFFFFLL;
    *(_OWORD *)&v23[4] = 0u;
    v24 = 0u;
    v25 = 0;
    v26 = 0x7FFFFFFFLL;
    v19 = (_DWORD *)re::HashTable<unsigned long long,re::PeerTransferReport,re::Hash<unsigned long long>,re::EqualTo<unsigned long long>,true,false>::addNew(v18, &v28, &v21);
    re::HashTable<re::Pair<re::StringSlice,re::StringSlice,true>,unsigned long,re::Hash<re::Pair<re::StringSlice,re::StringSlice,true>>,re::EqualTo<re::Pair<re::StringSlice,re::StringSlice,true>>,true,false>::deinit((uint64_t *)&v23[4]);
    re::HashTable<re::AssetType const*,std::pair<unsigned long,unsigned long>,re::Hash<re::AssetType const*>,re::EqualTo<re::AssetType const*>,true,false>::deinit((uint64_t *)v22);
  }
  return re::PeerTransferReport::addEntry(v19, a5, a6, a7, a8 >> 3);
}

@end
