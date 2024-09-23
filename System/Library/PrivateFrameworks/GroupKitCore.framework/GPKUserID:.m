@implementation GPKUserID:

- (unint64_t)String
{
  uint64_t v0;
  unint64_t v1;
  uint64_t v3;

  v3 = lazy protocol witness table cache variable for type [GPKUserID : String] and conformance [A : B];
  if (!lazy protocol witness table cache variable for type [GPKUserID : String] and conformance [A : B])
  {
    v0 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for [GPKUserID : String]);
    v1 = MEMORY[0x242635504](MEMORY[0x24BEE04D8], v0);
    atomic_store(v1, (unint64_t *)&lazy protocol witness table cache variable for type [GPKUserID : String] and conformance [A : B]);
    return v1;
  }
  return v3;
}

{
  uint64_t v0;
  unint64_t v1;
  uint64_t v3;

  v3 = lazy protocol witness table cache variable for type [GPKUserID : String] and conformance [A : B];
  if (!lazy protocol witness table cache variable for type [GPKUserID : String] and conformance [A : B])
  {
    v0 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for [GPKUserID : String]);
    v1 = MEMORY[0x242635504](MEMORY[0x24BEE04E8], v0);
    atomic_store(v1, (unint64_t *)&lazy protocol witness table cache variable for type [GPKUserID : String] and conformance [A : B]);
    return v1;
  }
  return v3;
}

- (void)String
{
  swift_bridgeObjectRelease();
}

- (_QWORD)Data
{
  _QWORD *result;
  uint64_t v4;

  v4 = *a1;
  swift_bridgeObjectRetain();
  result = a2;
  *a2 = v4;
  return result;
}

- (uint64_t)Data
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(uint64_t);
  int *v11;
  uint64_t v12;
  uint64_t v13;

  swift_release();
  swift_bridgeObjectRelease();
  v7 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (group: GPKGroup, invitations: [GPKUserID : Data], groupBlob: GKCrypto_GroupBlob))
              + 64);
  outlined consume of Data._Representation(*(_QWORD *)(a1 + v7 + 8), *(_QWORD *)(a1 + v7 + 16));
  outlined consume of Data._Representation(*(_QWORD *)(a1 + v7 + 24), *(_QWORD *)(a1 + v7 + 32));
  v11 = (int *)type metadata accessor for GKCrypto_GroupBlob();
  v8 = v11[7];
  v9 = type metadata accessor for UnknownStorage();
  v10 = *(void (**)(uint64_t))(*(_QWORD *)(v9 - 8) + 8);
  v10(a1 + v7 + v8);
  v12 = v11[8];
  v13 = type metadata accessor for GKCrypto_GroupBlob.RandomizedVerificationKeys();
  if (!(*(unsigned int (**)(uint64_t, uint64_t))(*(_QWORD *)(v13 - 8) + 48))(a1 + v7 + v12, 1))
  {
    swift_bridgeObjectRelease();
    ((void (*)(uint64_t, uint64_t))v10)(a1 + v7 + v12 + *(int *)(v13 + 20), v9);
  }
  v4 = a1 + v7 + v11[9];
  v5 = type metadata accessor for GKCrypto_GroupBlob.GroupBlobPublicKeys();
  if (!(*(unsigned int (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 48))(v4, 1))
  {
    outlined consume of Data._Representation(*(_QWORD *)v4, *(_QWORD *)(v4 + 8));
    outlined consume of Data._Representation(*(_QWORD *)(v4 + 16), *(_QWORD *)(v4 + 24));
    outlined consume of Data._Representation(*(_QWORD *)(v4 + 32), *(_QWORD *)(v4 + 40));
    outlined consume of Data._Representation(*(_QWORD *)(v4 + 48), *(_QWORD *)(v4 + 56));
    ((void (*)(uint64_t, uint64_t))v10)(v4 + *(int *)(v5 + 32), v9);
  }
  v2 = a1 + v7 + v11[10];
  v3 = type metadata accessor for GKCrypto_GroupBlob.GroupBlobSignatures();
  if (!(*(unsigned int (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 48))(v2, 1))
  {
    outlined consume of Data._Representation(*(_QWORD *)v2, *(_QWORD *)(v2 + 8));
    outlined consume of Data._Representation(*(_QWORD *)(v2 + 16), *(_QWORD *)(v2 + 24));
    outlined consume of Data._Representation(*(_QWORD *)(v2 + 32), *(_QWORD *)(v2 + 40));
    ((void (*)(uint64_t, uint64_t))v10)(v2 + *(int *)(v3 + 28), v9);
  }
  return a1;
}

- (void)GPKMember
{
  swift_bridgeObjectRelease();
}

- (void)GPKMemberRole
{
  swift_bridgeObjectRelease();
}

- (uint64_t)GPKMemberRole
{
  return swift_release();
}

- (unint64_t)GPKMemberRole
{
  uint64_t v0;
  unint64_t v1;
  uint64_t v3;

  v3 = lazy protocol witness table cache variable for type [GPKUserID : GPKMemberRole] and conformance [A : B];
  if (!lazy protocol witness table cache variable for type [GPKUserID : GPKMemberRole] and conformance [A : B])
  {
    v0 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for [GPKUserID : GPKMemberRole]);
    v1 = MEMORY[0x242635504](MEMORY[0x24BEE04F0], v0);
    atomic_store(v1, (unint64_t *)&lazy protocol witness table cache variable for type [GPKUserID : GPKMemberRole] and conformance [A : B]);
    return v1;
  }
  return v3;
}

- (unint64_t)Data
{
  uint64_t v0;
  unint64_t v1;
  uint64_t v3;

  v3 = lazy protocol witness table cache variable for type [GPKUserID : Data] and conformance [A : B];
  if (!lazy protocol witness table cache variable for type [GPKUserID : Data] and conformance [A : B])
  {
    v0 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for [GPKUserID : Data]);
    v1 = MEMORY[0x242635504](MEMORY[0x24BEE04F0], v0);
    atomic_store(v1, (unint64_t *)&lazy protocol witness table cache variable for type [GPKUserID : Data] and conformance [A : B]);
    return v1;
  }
  return v3;
}

- (void)Data
{
  swift_bridgeObjectRelease();
}

@end
