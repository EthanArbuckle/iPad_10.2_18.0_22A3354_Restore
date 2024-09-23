_QWORD *CoreIKCreateAltruisticSolverInstance(ikinema::processedRigs *a1)
{
  FIK *BPERigObject;
  void (***v2)(FIK::CrtAllocator *__hidden);
  _QWORD *v3;
  _QWORD *v4;
  _QWORD *v5;
  FIK::AnimNode *v6;
  FIK *v7;
  ikinema::processedRigs *v8;
  uint64_t v9;
  const char *v10;
  uint64_t *v11;
  void *v12;
  uint64_t v14;
  uint64_t v15;
  void (***v16)(FIK::CrtAllocator *__hidden);
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  FIK *v27;
  unint64_t v28;
  FIK *v29;
  uint64_t v30;
  _QWORD v31[2];
  uint64_t v32;
  uint64_t v33[4];
  uint64_t v34[4];
  uint64_t v35[12];

  v35[11] = *MEMORY[0x24BDAC8D0];
  BPERigObject = (FIK *)ikinema::processedRigs::getBPERigObject(a1, (uint64_t)v31);
  v2 = FIK::defaultAllocator(BPERigObject);
  v3 = (_QWORD *)((uint64_t (*)(void (***)(FIK::CrtAllocator *__hidden), uint64_t, uint64_t))(*v2)[2])(v2, 640, 16);
  v4 = v3;
  if (!v3)
    goto LABEL_20;
  v5 = CoreIK::IKSolverRetarget::IKSolverRetarget(v3);
  v6 = (FIK::AnimNode *)(*(uint64_t (**)(_QWORD *))(*v4 + 80))(v5);
  v7 = (FIK *)(*(uint64_t (**)(FIK::AnimNode *))(*(_QWORD *)v6 + 64))(v6);
  v14 = 0;
  v15 = 0;
  v16 = FIK::defaultAllocator(v7);
  IKString::assign(&v14, "rawSources", (IKString *)0xA);
  v8 = (ikinema::processedRigs *)FIK::AnimNode::registerBuffer<FIK::Transform>((uint64_t)v6, (uint64_t)&v14, v35[0]);
  v9 = (uint64_t)v8;
  if (v15)
    v8 = (ikinema::processedRigs *)((uint64_t (*)(void (***)(FIK::CrtAllocator *__hidden), uint64_t, _QWORD, uint64_t))(*v16)[3])(v16, v14, 0, 8);
  ikinema::processedRigs::getBPEHelperHierarchyBoneDefinitions(v8, &v28);
  FIK::createHelperHierarchy(v29, v28, &v14);
  ikinema::BoneNormalisationAlgorithm::create(&v14, v9, (uint64_t)v7, &v27);
  v24 = 0;
  if (v25)
    (*(void (**)(uint64_t, uint64_t, _QWORD, uint64_t))(*(_QWORD *)v26 + 24))(v26, v25, 0, 8);
  v21 = 0;
  if (v22)
    (*(void (**)(uint64_t, uint64_t, _QWORD, uint64_t))(*(_QWORD *)v23 + 24))(v23, v22, 0, 8);
  v18 = 0;
  if (v19)
    (*(void (**)(uint64_t, uint64_t, _QWORD, uint64_t))(*(_QWORD *)v20 + 24))(v20, v19, 0, 8);
  v14 = 0;
  if (v16)
    (*(void (**)(uint64_t, void (***)(FIK::CrtAllocator *__hidden), _QWORD, uint64_t))(*(_QWORD *)v17 + 24))(v17, v16, 0, 8);
  if (FIK::AnimNode::insertAlgorithmBefore((uint64_t)v6, 0, (uint64_t *)&v27))
  {
    v10 = "(false) Algorithm Insert Failed.";
  }
  else
  {
    (*(void (**)(FIK::AnimNode *, uint64_t))(*(_QWORD *)v6 + 56))(v6, v9);
    if ((FIK::AnimNode::validateAlgorithms(v6) & 1) != 0)
      goto LABEL_16;
    v10 = "(composableSolver->validateAlgorithms()) Failed to validate algorithms.";
  }
  v11 = ikinemaLogObject();
  ikinemaAssertHandler(*v11, 0, (uint64_t)"CoreIKCreateAltruisticSolverInstance", v10);
LABEL_16:
  if (v27)
  {
    (*(void (**)(FIK *))(*(_QWORD *)v27 + 8))(v27);
    FIK::FIKFree(v27, v12);
  }
  v28 = 0;
  if (v29)
    (*(void (**)(uint64_t, FIK *, _QWORD, uint64_t))(*(_QWORD *)v30 + 24))(v30, v29, 0, 8);
LABEL_20:
  FIK::IKArray<FIK::RigBoneBase>::~IKArray(v35);
  FIK::IKArray<FIK::MoCapBone>::~IKArray(v34);
  FIK::IKArray<FIK::MoCapTask>::~IKArray(v33);
  if (v31[1])
    (*(void (**)(uint64_t, _QWORD, _QWORD, uint64_t))(*(_QWORD *)v32 + 24))(v32, v31[0], 0, 8);
  return v4;
}

uint64_t CoreIKSolveModelSpaceSource(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  kdebug_trace();
  if (a4)
    v12 = a6;
  else
    v12 = 0;
  if (a5)
    v13 = a6;
  else
    v13 = 0;
  v14 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)a1 + 32))(a1, a2, a3, 1, a4, v12, a5, v13);
  kdebug_trace();
  return v14;
}

uint64_t CoreIKJointCollectionSize(CoreIKConstraint *a1)
{
  FIK::AnimNode **v1;

  v1 = (FIK::AnimNode **)CoreIKConstraint::interface(a1);
  return ikinema::JointCollection::elementCount(v1);
}

uint64_t CoreIKJointCollectionGet(CoreIKConstraint *a1, unint64_t a2)
{
  FIK::AnimNode **v3;
  CoreIKConstraint *v4;

  v3 = (FIK::AnimNode **)CoreIKConstraint::interface(a1);
  v4 = (CoreIKConstraint *)ikinema::JointCollection::element(v3, a2);
  return CoreIKConstraint::interface(v4);
}

uint64_t CoreIKConstraintCollectionSize(CoreIKConstraint *a1)
{
  ikinema::ConstraintCollection *v1;

  v1 = (ikinema::ConstraintCollection *)CoreIKConstraint::interface(a1);
  return ikinema::ConstraintCollection::elementCount(v1);
}

uint64_t CoreIKConstraintCollectionGet(CoreIKConstraint *a1)
{
  ikinema::ConstraintCollection *v1;
  CoreIKConstraint *v2;

  v1 = (ikinema::ConstraintCollection *)CoreIKConstraint::interface(a1);
  v2 = (CoreIKConstraint *)ikinema::ConstraintCollection::element(v1);
  return CoreIKConstraint::interface(v2);
}

uint64_t CoreIKSolverAddAlgorithm_UseRotationFromSource(uint64_t a1, uint64_t a2, _QWORD *a3, unint64_t a4)
{
  FIK::AnimNode *v7;
  uint64_t v8;
  uint64_t Rig;
  uint64_t v10;
  unsigned int inserted;
  uint64_t v12;
  void *v13;
  NSObject *v14;
  FIK *v16;

  v7 = (FIK::AnimNode *)(*(uint64_t (**)(uint64_t))(*(_QWORD *)a1 + 80))(a1);
  if (v7)
  {
    v8 = (uint64_t)v7;
    Rig = FIK::AnimNode::GetRig(v7);
    v10 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)v8 + 64))(v8);
    ikinema::SourceRotatesDependentsAlgorithm::create(Rig, a2, a3, a4, v10, (float32x4_t **)&v16);
    inserted = FIK::AnimNode::insertAlgorithmBefore(v8, 0, (uint64_t *)&v16);
    v12 = translateResult(inserted);
    if (v16)
    {
      (*(void (**)(FIK *))(*(_QWORD *)v16 + 8))(v16);
      FIK::FIKFree(v16, v13);
    }
  }
  else
  {
    v14 = ikinemaLogObject()[1];
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      CoreIKSolverAddAlgorithm_UseRotationFromSource_cold_1(v14);
    return 3;
  }
  return v12;
}

uint64_t CoreIKGenericSolverCreate(FIK *a1)
{
  NSObject *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t result;
  void (***v10)(FIK::CrtAllocator *__hidden);

  if (*((_DWORD *)a1 + 88))
  {
    v1 = ikinemaLogObject()[2];
    if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
      CoreIKGenericSolverCreate_cold_1(v1, v2, v3, v4, v5, v6, v7, v8);
    return 0;
  }
  else
  {
    v10 = FIK::defaultAllocator(a1);
    result = ((uint64_t (*)(void (***)(FIK::CrtAllocator *__hidden), uint64_t, uint64_t))(*v10)[2])(v10, 544, 16);
    if (result)
      return FIK::GenericSolver::GenericSolver(result);
  }
  return result;
}

void (***CoreIKGenericSolverDestroy(FIK *a1))(FIK::CrtAllocator *__hidden this)
{
  void (***result)(FIK::CrtAllocator *__hidden);
  void (***v3)(FIK::CrtAllocator *__hidden);

  result = FIK::defaultAllocator(a1);
  if (a1)
  {
    v3 = result;
    (**(void (***)(FIK *))a1)(a1);
    return (void (***)(FIK::CrtAllocator *__hidden))((uint64_t (*)(void (***)(FIK::CrtAllocator *__hidden), FIK *, _QWORD, uint64_t))(*v3)[3])(v3, a1, 0, 8);
  }
  return result;
}

uint64_t CoreIKGenericSolverGetJointCount(FIK::GenericSolver *a1)
{
  return (int)FIK::GenericSolver::GetNumBones(a1);
}

uint64_t CoreIKGenericSolverGetJoint(FIK::IKSolver **a1, unsigned int a2)
{
  CoreIKConstraint *Segment;

  Segment = (CoreIKConstraint *)FIK::GenericSolver::GetSegment(a1, a2);
  return CoreIKConstraint::interface(Segment);
}

uint64_t CoreIKGenericSolverGetJointNames(FIK::GenericSolver *a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v5;
  uint64_t v6;
  uint64_t Segment;

  result = FIK::GenericSolver::GetNumBones(a1);
  if ((_DWORD)result)
  {
    v5 = 0;
    v6 = (int)result;
    do
    {
      Segment = FIK::GenericSolver::GetSegment((FIK::IKSolver **)a1, v5);
      result = (*(uint64_t (**)(uint64_t))(*(_QWORD *)Segment + 936))(Segment);
      *(_QWORD *)(a2 + 8 * v5++) = result;
    }
    while (v6 != v5);
  }
  return result;
}

uint64_t CoreIKGenericSolverSetRestPose(FIK::GenericSolver *a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v5;
  uint64_t v6;
  uint64_t Segment;

  result = FIK::GenericSolver::GetNumBones(a1);
  if ((_DWORD)result)
  {
    v5 = 0;
    v6 = (int)result;
    do
    {
      Segment = FIK::GenericSolver::GetSegment((FIK::IKSolver **)a1, v5);
      result = (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)Segment + 440))(Segment, a2);
      ++v5;
      a2 += 32;
    }
    while (v6 != v5);
  }
  return result;
}

double CoreIKGenericSolverSetWorldToSolverTransform(uint64_t a1, __n128 a2, __n128 a3)
{
  double result;
  _OWORD v4[2];

  v4[0] = a2;
  v4[1] = a3;
  *(_QWORD *)&result = FIK::GenericSolver::SetWorldToSolverTransform(a1, (uint64_t)v4).n128_u64[0];
  return result;
}

uint64_t CoreIKGenericSolverGetConstraintCount(FIK::GenericSolver *a1)
{
  return (int)FIK::GenericSolver::GetNumTasks(a1);
}

uint64_t CoreIKGenericConstraintSetTargetParameters(uint64_t a1, __n128 a2, __n128 a3, float a4, float a5)
{
  _OWORD v6[2];

  v6[0] = a2;
  v6[1] = a3;
  return FIK::RTGameTask::SetTargetParams(a1, v6, a4, a5);
}

float CoreIKGenericConstraintGetTargetBlendWeights(FIK::RTGameTask *a1)
{
  return *(float *)FIK::RTGameTask::GetAlphas(a1);
}

float CoreIKGenericConstraintGetTranslationTargetBlendWeight(uint64_t a1)
{
  return *(float *)(a1 + 416);
}

uint64_t CoreIKGenericConstraintSetTranslationTargetBlendWeight(uint64_t a1, float a2)
{
  float v2;
  BOOL v3;
  float v4;

  v2 = 1.0;
  if (a2 <= 1.0)
    v2 = a2;
  v3 = a2 < 0.0;
  v4 = 0.0;
  if (!v3)
    v4 = v2;
  return FIK::RTGameTask::SetPositionAlpha(a1, v4);
}

float CoreIKGenericConstraintGetOrientationTargetBlendWeight(uint64_t a1)
{
  return *(float *)(a1 + 420);
}

uint64_t CoreIKGenericConstraintSetOrientationTargetBlendWeight(uint64_t a1, float a2)
{
  float v2;
  BOOL v3;
  float v4;

  v2 = 1.0;
  if (a2 <= 1.0)
    v2 = a2;
  v3 = a2 < 0.0;
  v4 = 0.0;
  if (!v3)
    v4 = v2;
  return FIK::RTGameTask::SetRotationAlpha(a1, v4);
}

uint64_t CoreIKGenericConstraintSetTargetBlendWeights(uint64_t a1, float a2, float a3)
{
  float v3;
  float v4;
  float v5;
  float v6;

  v3 = 1.0;
  if (a2 <= 1.0)
    v4 = a2;
  else
    v4 = 1.0;
  if (a2 >= 0.0)
    v5 = v4;
  else
    v5 = 0.0;
  if (a3 <= 1.0)
    v3 = a3;
  if (a3 >= 0.0)
    v6 = v3;
  else
    v6 = 0.0;
  return FIK::RTGameTask::SetAlpha(a1, v5, v6);
}

double CoreIKGenericConstraintSetTargetTranslation(__n128 *a1, __n128 a2)
{
  double result;
  __n128 v3;

  a2.n128_u32[3] = 0;
  v3 = a2;
  *(_QWORD *)&result = FIK::RTGameTask::SetPositionTarget(a1, &v3).n128_u64[0];
  return result;
}

double CoreIKGenericConstraintSetTargetOrientation(__n128 *a1, __n128 a2)
{
  double result;
  __n128 v3;

  v3 = a2;
  *(_QWORD *)&result = FIK::RTGameTask::SetRotationTarget(a1, &v3).n128_u64[0];
  return result;
}

uint64_t CoreIKGenericConstraintHasLookAtEnabled(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 281);
}

__n128 CoreIKGenericConstraintGetLookAtTarget(__n128 *a1)
{
  return a1[23];
}

double CoreIKGenericConstraintSetLookAtTarget(__n128 *a1, __n128 a2)
{
  double result;
  __n128 v3;

  a2.n128_u32[3] = 0;
  v3 = a2;
  *(_QWORD *)&result = FIK::RTGameTask::SetLookAtTarget(a1, &v3).n128_u64[0];
  return result;
}

double CoreIKGenericConstraintSetLookAtParameters(uint64_t a1, __n128 a2, float a3)
{
  double result;
  __n128 v4;
  __n128 v5;

  a2.n128_u32[3] = 0;
  v5 = a2;
  v4 = 0uLL;
  *(_QWORD *)&result = FIK::RTGameTask::SetLookAtTargetParams(a1, &v5, &v4, a3, 0.0).n128_u64[0];
  return result;
}

double CoreIKGenericConstraintGetLookAtAxis(uint64_t a1)
{
  __int128 v1;

  if (*(_BYTE *)(a1 + 281) || *(_BYTE *)(a1 + 280))
    v1 = *(_OWORD *)(a1 + 224);
  else
    *(_QWORD *)&v1 = 0;
  return *(double *)&v1;
}

__n128 *CoreIKGenericConstraintSetLookAtAxis(__n128 *result, __n128 a2)
{
  if (result[17].n128_u8[9] || result[17].n128_u8[8])
    result[14] = a2;
  return result;
}

uint64_t CoreIKGenericConstraintSetUseLocalSpaceLookAtAxis(uint64_t result)
{
  if (*(_BYTE *)(result + 281))
    *(_BYTE *)(result + 280) = 1;
  return result;
}

BOOL CoreIKGenericConstraintGetUseLocalSpaceLookAtAxis(uint64_t a1)
{
  return *(_BYTE *)(a1 + 281) && *(_BYTE *)(a1 + 280) != 0;
}

uint64_t CoreIKGenericConstraintSetUseModelSpaceLookAtAxis(uint64_t result)
{
  if (*(_BYTE *)(result + 281))
    *(_BYTE *)(result + 280) = 0;
  return result;
}

BOOL CoreIKGenericConstraintGetUseModelSpaceLookAtAxis(uint64_t a1)
{
  return *(_BYTE *)(a1 + 281) && *(_BYTE *)(a1 + 280) == 0;
}

uint64_t CoreIKGenericSolverSolve(FIK::GenericSolver *a1, uint64_t a2, uint64_t a3)
{
  int v4;
  unsigned int v5;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD v15[2];

  v15[0] = a2;
  v15[1] = a3;
  if ((int)FIK::GenericSolver::GetNumBones(a1) == a3)
  {
    v4 = (*(uint64_t (**)(FIK::GenericSolver *, _QWORD *))(*(_QWORD *)a1 + 32))(a1, v15);
    if (v4 == 1)
      v5 = 2;
    else
      v5 = 1;
    if (v4)
      return v5;
    else
      return 0;
  }
  else
  {
    v7 = ikinemaLogObject()[1];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      CoreIKGenericSolverSolve_cold_1(v7, v8, v9, v10, v11, v12, v13, v14);
    return 1;
  }
}

void *CoreIKGenericSolverGetConstraintTargetName(FIK::GenericSolver *a1, unsigned int a2)
{
  uint64_t TaskInstancePtr;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  TaskInstancePtr = FIK::GenericSolver::GetTaskInstancePtr(a1, a2);
  if (TaskInstancePtr)
  {
    if (*(_QWORD *)(TaskInstancePtr + 80))
      return *(void **)(TaskInstancePtr + 72);
  }
  else
  {
    v4 = ikinemaLogObject()[2];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      CoreIKGenericSolverGetConstraintTargetName_cold_1(v4, v5, v6, v7, v8, v9, v10, v11);
  }
  return &unk_2108059BE;
}

double CoreIKGenericSolverGetTargetRestPose(uint64_t a1, unint64_t a2)
{
  __int128 v2;
  NSObject *v3;
  _BOOL4 v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  if (*(_QWORD *)(a1 + 400) <= a2)
  {
    v3 = ikinemaLogObject()[2];
    v4 = os_log_type_enabled(v3, OS_LOG_TYPE_ERROR);
    *(_QWORD *)&v2 = 0;
    if (v4)
    {
      CoreIKGenericSolverGetTargetRestPose_cold_1(v3, v5, v6, v7, v8, v9, v10, v11);
      *(_QWORD *)&v2 = 0;
    }
  }
  else
  {
    v2 = *(_OWORD *)(*(_QWORD *)(a1 + 416) + (a2 << 8) + 64);
  }
  return *(double *)&v2;
}

uint64_t CoreIKGenericSolverGetConstraintIndex(uint64_t a1, char *__s)
{
  uint64_t v3;
  size_t v4;
  int v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  v3 = a1 + 192;
  v4 = strlen(__s);
  v5 = FIK::IKRigUtils::GetTaskIndexByBoneName<FIK::GameRig>(__s, v4, v3);
  if (v5 == -1)
  {
    v6 = ikinemaLogObject()[2];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      CoreIKGenericSolverGetConstraintIndex_cold_1(v6, v7, v8, v9, v10, v11, v12, v13);
  }
  return v5;
}

float CoreIKGenericSolverGetRetargetingGain(FIK::GenericSolver *a1)
{
  FIK::Solver **Solver;

  Solver = (FIK::Solver **)FIK::GenericSolver::GetSolver(a1);
  return FIK::IKSolver::getRetargetingGain(Solver);
}

float CoreIKGenericSolverSetRetargetingGain(FIK::GenericSolver *a1, float a2)
{
  FIK::Solver **Solver;

  Solver = (FIK::Solver **)FIK::GenericSolver::GetSolver(a1);
  return FIK::IKSolver::setRetargetingGain(Solver, a2);
}

uint64_t CoreIKGenericSolverSetPGain(FIK::GenericSolver *a1, float a2)
{
  FIK::IKSolver *Solver;

  Solver = (FIK::IKSolver *)FIK::GenericSolver::GetSolver(a1);
  return FIK::IKSolver::setPGain(Solver, a2);
}

BOOL CoreIKGenericSolverRigGetLookAtEnabled(uint64_t a1, char *__s)
{
  IKString *v4;

  v4 = (IKString *)strlen(__s);
  return CoreIKRig::getLookAtEnabled(a1, __s, v4);
}

FIK *CoreIKGenericSolverRigSetLookAtEnabled(FIK *a1, char *__s, char a3)
{
  IKString *v6;

  v6 = (IKString *)strlen(__s);
  return CoreIKRig::setLookAtEnabled(a1, __s, v6, a3);
}

double CoreIKGenericSolverRigGetLookAtAxis(uint64_t a1, char *__s)
{
  IKString *v4;
  double result;

  v4 = (IKString *)strlen(__s);
  *(_QWORD *)&result = CoreIKRig::getLookAtAxis(a1, __s, v4).n128_u64[0];
  return result;
}

double CoreIKGenericSolverRigSetLookAtAxis(uint64_t a1, char *__s, __n128 a3)
{
  IKString *v5;
  double result;

  v5 = (IKString *)strlen(__s);
  *(_QWORD *)&result = CoreIKRig::setLookAtAxis(a1, __s, v5, a3).n128_u64[0];
  return result;
}

BOOL CoreIKGenericSolverRigIsUsingLocalSpaceLookAtAxis(uint64_t a1, char *__s)
{
  IKString *v4;

  v4 = (IKString *)strlen(__s);
  return CoreIKRig::getUsesLocalSpaceLookAtAxis(a1, __s, v4);
}

FIK *CoreIKGenericSolverRigSetUsesLocalSpaceLookAtAxis(FIK *a1, char *__s)
{
  IKString *v4;

  v4 = (IKString *)strlen(__s);
  return CoreIKRig::setUsesLocalSpaceLookAtAxis(a1, __s, v4);
}

BOOL CoreIKGenericSolverRigIsUsingModelSpaceLookAtAxis(uint64_t a1, char *__s)
{
  IKString *v4;

  v4 = (IKString *)strlen(__s);
  return CoreIKRig::getUsesModelSpaceLookAtAxis(a1, __s, v4);
}

FIK *CoreIKGenericSolverRigSetUsesModelSpaceLookAtAxis(FIK *a1, char *__s)
{
  IKString *v4;

  v4 = (IKString *)strlen(__s);
  return CoreIKRig::setUsesModelSpaceLookAtAxis(a1, __s, v4);
}

void (***CoreIKSolver::destroy(CoreIKSolver *this, CoreIKSolver *a2))(FIK::CrtAllocator *__hidden this)
{
  void (***v3)(FIK::CrtAllocator *__hidden);
  uint64_t *v5;
  FIK *v6;

  if (this)
  {
    v3 = FIK::defaultAllocator(this);
    (**(void (***)(CoreIKSolver *))this)(this);
    return (void (***)(FIK::CrtAllocator *__hidden))((uint64_t (*)(void (***)(FIK::CrtAllocator *__hidden), CoreIKSolver *, _QWORD, uint64_t))(*v3)[3])(v3, this, 0, 8);
  }
  else
  {
    v5 = ikinemaLogObject();
    v6 = (FIK *)ikinemaAssertHandler(*v5, 0, (uint64_t)"destroy", "(solver != nullptr) Can't destroy a null object");
    return FIK::defaultAllocator(v6);
  }
}

void FIK::Solver::solve(os_log_t log)
{
  int v1;
  const char *v2;
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  v1 = 136315138;
  v2 = "solve";
  _os_log_error_impl(&dword_21078E000, log, OS_LOG_TYPE_ERROR, "%s: Bad solver tuning detected.", (uint8_t *)&v1, 0xCu);
}

void FIK::SetMemoryRoutines()
{
  uint64_t *v0;

  v0 = ikinemaLogObject();
  ikinemaAssertHandler(*v0, 0, (uint64_t)"SetMemoryRoutines", "(false) Dynamic memory routines must always be in pairs");
  __break(1u);
}

void FIK::IKRigUtils::updateSourceIndices(os_log_t log)
{
  int v1;
  const char *v2;
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  v1 = 136315138;
  v2 = "updateSourceIndices";
  _os_log_error_impl(&dword_21078E000, log, OS_LOG_TYPE_ERROR, "%s: Invalid source name for constraint detected.", (uint8_t *)&v1, 0xCu);
}

void FIK::EnrollmentPoseSolver::EnrollmentPoseSolver(os_log_t log, float a2, float a3)
{
  int v3;
  const char *v4;
  __int16 v5;
  double v6;
  __int16 v7;
  double v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v3 = 136315650;
  v4 = "verifyRigAssumptions";
  v5 = 2048;
  v6 = a2;
  v7 = 2048;
  v8 = a3;
  _os_log_error_impl(&dword_21078E000, log, OS_LOG_TYPE_ERROR, "%s: Detected offset between hips and head (X: %.4f, Z: %.4f)", (uint8_t *)&v3, 0x20u);
}

void FIK::EnrollmentPoseSolver::setupPreprocessingSources(os_log_t log)
{
  int v1;
  const char *v2;
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  v1 = 136315138;
  v2 = "setupPreprocessingSources";
  _os_log_error_impl(&dword_21078E000, log, OS_LOG_TYPE_ERROR, "%s: Failed to setup virtual hips compensation", (uint8_t *)&v1, 0xCu);
  OUTLINED_FUNCTION_1();
}

void FIK::EnrollmentPoseSolverV2::inputsAreValidGivenRig(_QWORD *a1, void **a2, NSObject *a3)
{
  void *v3;
  int v4;
  const char *v5;
  __int16 v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  if (*a1)
    v3 = *a2;
  else
    v3 = &unk_2108059BE;
  v4 = 136315394;
  v5 = "inputsAreValidGivenRig";
  v6 = 2080;
  v7 = v3;
  OUTLINED_FUNCTION_0(&dword_21078E000, a3, (uint64_t)a3, "%s: Rig joint: %s not found in input targets.", (uint8_t *)&v4);
  OUTLINED_FUNCTION_1();
}

void FIK::EnrollmentPoseSolverV2::inputsAreValidGivenRig(uint64_t a1, NSObject *a2, uint64_t a3)
{
  int v3;
  const char *v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = 136315394;
  v4 = "inputsAreValidGivenRig";
  v5 = 2080;
  v6 = a1;
  OUTLINED_FUNCTION_0(&dword_21078E000, a2, a3, "%s: Rig joint: %s not found in input sources.", (uint8_t *)&v3);
  OUTLINED_FUNCTION_1();
}

void FIK::EnrollmentPoseSolverV4::areAllRequiredJointsProvided(uint64_t a1, uint64_t a2, NSObject *a3)
{
  uint64_t v3;
  void *v4;
  int v5;
  const char *v6;
  __int16 v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v3 = *(_QWORD *)(a1 + 336);
  if (*(_QWORD *)(v3 + 544 * a2 + 16))
    v4 = *(void **)(v3 + 544 * a2 + 8);
  else
    v4 = &unk_2108059BE;
  v5 = 136315394;
  v6 = "areAllRequiredJointsProvided";
  v7 = 2080;
  v8 = v4;
  OUTLINED_FUNCTION_0(&dword_21078E000, a3, (uint64_t)a3, "%s: Rig joint %s not found in input targets.", (uint8_t *)&v5);
}

void FIK::EnrollmentPoseSolverV4::areAllRequiredJointsProvided(uint64_t a1, NSObject *a2, uint64_t a3)
{
  int v3;
  const char *v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = 136315394;
  v4 = "areAllRequiredJointsProvided";
  v5 = 2080;
  v6 = a1;
  OUTLINED_FUNCTION_0(&dword_21078E000, a2, a3, "%s: Rig joint %s not found in input sources.", (uint8_t *)&v3);
}

void FIK::TargetSmoothing::smooth()
{
  uint64_t *v0;

  v0 = ikinemaLogObject();
  ikinemaAssertHandler(*v0, 0, (uint64_t)"smooth", "(false) Unhandled target smoothing mode was used");
  __break(1u);
}

void FIK::estimateBoneRotationFromVelocity()
{
  uint64_t *v0;

  v0 = ikinemaLogObject();
  ikinemaAssertHandler(*v0, 0, (uint64_t)"estimateBoneRotationFromVelocity", "(false) Unsupported axis.");
  __break(1u);
}

void ikinema::DoSolveAlgorithmImpl::process(os_log_t log)
{
  int v1;
  const char *v2;
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  v1 = 136315138;
  v2 = "process";
  _os_log_error_impl(&dword_21078E000, log, OS_LOG_TYPE_ERROR, "%s: Solve has failed.", (uint8_t *)&v1, 0xCu);
}

void FIK::EnrollmentHelpers::verifyRigEnrolment(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_21078E000, a1, a3, "%s: Neck length vs shoulder width ratio is irregular.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

{
  OUTLINED_FUNCTION_0_0(&dword_21078E000, a1, a3, "%s: Right arm asymmetry detected.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

{
  OUTLINED_FUNCTION_0_0(&dword_21078E000, a1, a3, "%s: Left arm asymmetry detected.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

{
  OUTLINED_FUNCTION_0_0(&dword_21078E000, a1, a3, "%s: Arms asymmetry detected.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

{
  OUTLINED_FUNCTION_0_0(&dword_21078E000, a1, a3, "%s: Forearms asymmetry detected.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

{
  OUTLINED_FUNCTION_0_0(&dword_21078E000, a1, a3, "%s: Right arm length out of expected range.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

{
  OUTLINED_FUNCTION_0_0(&dword_21078E000, a1, a3, "%s: Left arm length out of expected range.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

{
  OUTLINED_FUNCTION_0_0(&dword_21078E000, a1, a3, "%s: Right forearm length out of expected range.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

{
  OUTLINED_FUNCTION_0_0(&dword_21078E000, a1, a3, "%s: Left forearm length out of expected range.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

{
  OUTLINED_FUNCTION_0_0(&dword_21078E000, a1, a3, "%s: Armspan length out of expected range.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void `anonymous namespace'::highestMagnitudeAxis()
{
  uint64_t *v0;

  v0 = ikinemaLogObject();
  ikinemaAssertHandler(*v0, 0, (uint64_t)"highestMagnitudeAxis", "(false) Should be unreachable");
  __break(1u);
}

void FIK::GenericSolver::extractEstimatedPose(uint8_t *a1, _QWORD *a2, NSObject *a3)
{
  *(_DWORD *)a1 = 136315138;
  *a2 = "extractEstimatedPose";
  OUTLINED_FUNCTION_0_1(&dword_21078E000, a3, (uint64_t)a3, "%s: No corresponding task in estimation solver. Cannot set esimtated pose.", a1);
}

void FIK::GenericSolver::Solve(NSObject *a1, uint64_t a2, uint64_t a3)
{
  int v3;
  const char *v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v3 = 136315138;
  v4 = "Solve";
  OUTLINED_FUNCTION_0_1(&dword_21078E000, a1, a3, "%s: Estimation solver auto-tune failed.", (uint8_t *)&v3);
}

void FIK::Enrollment::DataLogger::DataLogger(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_21078E000, a1, a3, "%s: Unable to open file for writing solved pose data", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

{
  OUTLINED_FUNCTION_0_0(&dword_21078E000, a1, a3, "%s: Unable to open file for writing task target data", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void FIK::Enrollment::DataLogger::exportSources(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_21078E000, a1, a3, "%s: Unable to open file for writing raw source data", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void FIK::Enrollment::DataLogger::exportEnrollment(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_21078E000, a1, a3, "%s: Unable to open file for writing bone lengths data", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void FIK::Enrollment::DataLogger::exportComputedSources(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_21078E000, a1, a3, "%s: Unable to open file for writing computed source data", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void FIK::Enrollment::SourceAndTargetDataLogger::exportOriginalSources(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_21078E000, a1, a3, "%s: Unable to open file for writing input source data", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void FIK::Enrollment::SourceAndTargetDataLogger::exportToFile(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_21078E000, a1, a3, "%s: Unable to open file for exporting pose data", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void FIK::Enrollment::SourceAndTargetDataLogger::exportEnrollmentData(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_21078E000, a1, a3, "%s: Unable to open file for writing bone lengths data", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void FIK::Enrollment::SourceAndTargetDataLogger::exportAtlasData(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_21078E000, a1, a3, "%s: Unable to open file for writing atlas data", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void FIK::MoCapRigBuilder::createMoCapRig()
{
  uint64_t *v0;

  v0 = ikinemaLogObject();
  ikinemaAssertHandler(*v0, 0, (uint64_t)"makeTask", "(false) No default task for associated joint type.");
  __break(1u);
}

void FIK::AnimNode::updateSolverBoneLengths()
{
  uint64_t *v0;

  v0 = ikinemaLogObject();
  ikinemaAssertHandler(*v0, 0, (uint64_t)"updateSolverBoneLengths", "(joint != nullptr) Joint not found.");
  __break(1u);
}

void FIK::RTGameTask::DoAlphaBlend()
{
  uint64_t *v0;

  v0 = ikinemaLogObject();
  ikinemaAssertHandler(*v0, 0, (uint64_t)"DoAlphaBlend", "(false) Unhandled target blend type was used.");
  __break(1u);
}

void FIK::Enrollment::SourceDefinition::cameraIndexForName()
{
  uint64_t *v0;

  v0 = ikinemaLogObject();
  ikinemaAssertHandler(*v0, 0, (uint64_t)"cameraNameToID", "(false) Unknown camera name passed to convertion method");
  __break(1u);
}

void CoreIKConstraint::setTarget(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_21078E000, a1, a3, "%s: Can't set target on a constraint that does not constrain position or orientation", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void CoreIKConstraint::setTargetTranslation(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_21078E000, a1, a3, "%s: Can't set position target on a constraint that does not constrain position", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void CoreIKConstraint::setTargetOrientation(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_21078E000, a1, a3, "%s: Can't set orientation target on a constraint that does not constrain orientation", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void CoreIKConstraint::getPositionEnabled(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_21078E000, a1, a3, "%s: Constraint has no task.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void CoreIKConstraint::setPositionEnabled(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_21078E000, a1, a3, "%s: Constraint has no task.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void CoreIKConstraint::getOrientationEnabled(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_21078E000, a1, a3, "%s: Constraint has no task.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void CoreIKConstraint::setOrientationEnabled(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_21078E000, a1, a3, "%s: Constraint has no task.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void CoreIKConstraint::getPositionAsPole(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_21078E000, a1, a3, "%s: Constraint has no task.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void CoreIKConstraint::setPositionAsPole(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_21078E000, a1, a3, "%s: Constraint has no task.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void CoreIKConstraint::getPositionDoFEnabled(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_21078E000, a1, a3, "%s: Constraint has no task.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void CoreIKConstraint::setPositionDoFEnabled(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_21078E000, a1, a3, "%s: Constraint has no task.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void CoreIKConstraint::getOrientationDoFEnabled(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_21078E000, a1, a3, "%s: Constraint has no task.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void CoreIKConstraint::setOrientationDoFEnabled(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_21078E000, a1, a3, "%s: Constraint has no task.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void CoreIKConstraint::getPositionDepth(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_21078E000, a1, a3, "%s: Constraint has no task.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void CoreIKConstraint::setPositionDepth(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_21078E000, a1, a3, "%s: Constraint has no task.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void CoreIKConstraint::getOrientationDepth(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_21078E000, a1, a3, "%s: Constraint has no task.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void CoreIKConstraint::setOrientationDepth(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_21078E000, a1, a3, "%s: Constraint has no task.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void CoreIKConstraint::getPositionWeight(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_21078E000, a1, a3, "%s: Constraint has no task.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void CoreIKConstraint::setPositionWeight(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_21078E000, a1, a3, "%s: Constraint has no task.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void CoreIKConstraint::getOrientationWeight(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_21078E000, a1, a3, "%s: Constraint has no task.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void CoreIKConstraint::setOrientationWeight(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_21078E000, a1, a3, "%s: Constraint has no task.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void CoreIKConstraint::getPositionPrecision(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_21078E000, a1, a3, "%s: Constraint has no task.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void CoreIKConstraint::setPositionPrecision(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_21078E000, a1, a3, "%s: Constraint has no task.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void CoreIKConstraint::getOrientationPrecision(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_21078E000, a1, a3, "%s: Constraint has no task.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void CoreIKConstraint::setOrientationPrecision(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_21078E000, a1, a3, "%s: Constraint has no task.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void CoreIKFootPlacementSolverCreate_cold_1(os_log_t log)
{
  int v1;
  const char *v2;
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  v1 = 136315138;
  v2 = "CoreIKFootPlacementSolverCreate";
  _os_log_error_impl(&dword_21078E000, log, OS_LOG_TYPE_ERROR, "%s: Incompatible/invalid rig instance used to create FootPlacementSolver.", (uint8_t *)&v1, 0xCu);
}

void ikinema::loadRigFromString()
{
  uint64_t *v0;
  uint64_t v1;

  v0 = ikinemaLogObject();
  OUTLINED_FUNCTION_5(*v0, v1, (uint64_t)"loadRigFromString", "(false) We must have handled all rig errors by this point.");
  __break(1u);
}

void ikinema::loadRigFromString(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_21078E000, a1, a3, "%s: Trying to load a rig with invalid type.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void logRigFromStringError(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_21078E000, a1, a3, "%s: Unable to parse a rig from string.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

{
  OUTLINED_FUNCTION_0_0(&dword_21078E000, a1, a3, "%s: Trying to load a rig from an empty string.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void logRigFromStringError(os_log_t log)
{
  int v1;
  const char *v2;
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  v1 = 136315138;
  v2 = "logRigFromStringError";
  _os_log_fault_impl(&dword_21078E000, log, OS_LOG_TYPE_FAULT, "%s: Loading a rig from string returned \"No such file\" error.", (uint8_t *)&v1, 0xCu);
  OUTLINED_FUNCTION_1();
}

void ikinema::loadRigFromFile()
{
  uint64_t *v0;
  uint64_t v1;

  v0 = ikinemaLogObject();
  OUTLINED_FUNCTION_5(*v0, v1, (uint64_t)"logRigFromFileError", "(false) This function must not handle success.");
  __break(1u);
}

void ikinema::loadRigFromFile(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_21078E000, a1, a3, "%s: Trying to load a rig from an empty file.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

{
  OUTLINED_FUNCTION_0_0(&dword_21078E000, a1, a3, "%s: Trying to load a rig from invalid file path.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

{
  OUTLINED_FUNCTION_0_0(&dword_21078E000, a1, a3, "%s: Unable to parse a rig from file contents.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void CoreIKRig::sourceJointCount()
{
  uint64_t *v0;
  uint64_t v1;

  v0 = ikinemaLogObject();
  OUTLINED_FUNCTION_5(*v0, v1, (uint64_t)"sourceJointCount", "(false) Unhandled rig type.");
  __break(1u);
}

void CoreIKRig::targetJointCount()
{
  uint64_t *v0;
  uint64_t v1;

  v0 = ikinemaLogObject();
  OUTLINED_FUNCTION_5(*v0, v1, (uint64_t)"targetJointCount", "(false) Unhandled rig type.");
  __break(1u);
}

void CoreIKRig::sourceJointName()
{
  uint64_t *v0;
  uint64_t v1;

  v0 = ikinemaLogObject();
  OUTLINED_FUNCTION_5(*v0, v1, (uint64_t)"sourceJointName", "(false) Unhandled rig type.");
  __break(1u);
}

void CoreIKRig::sourceJointName(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_21078E000, a1, a3, "%s: Invalid source joint index.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void CoreIKRig::targetJointName()
{
  uint64_t *v0;
  uint64_t v1;

  v0 = ikinemaLogObject();
  OUTLINED_FUNCTION_5(*v0, v1, (uint64_t)"targetJointName", "(false) Unhandled rig type");
  __break(1u);
}

void CoreIKRig::targetJointName(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_21078E000, a1, a3, "%s: Invalid target joint index.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void CoreIKRig::sourceJointParentName()
{
  uint64_t *v0;
  uint64_t v1;

  v0 = ikinemaLogObject();
  OUTLINED_FUNCTION_5(*v0, v1, (uint64_t)"sourceJointParentName", "(false) Unhandled rig type.");
  __break(1u);
}

void CoreIKRig::sourceJointParentName(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_21078E000, a1, a3, "%s: Invalid source joint index.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void CoreIKRig::targetJointParentName()
{
  uint64_t *v0;
  uint64_t v1;

  v0 = ikinemaLogObject();
  OUTLINED_FUNCTION_5(*v0, v1, (uint64_t)"targetJointParentName", "(false) Unhandled rig type.");
  __break(1u);
}

void CoreIKRig::targetJointParentName(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_21078E000, a1, a3, "%s: Invalid target joint index.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void CoreIKRig::updateConstraintWithSettings()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2(&dword_21078E000, v0, v1, "%s: Constraint not found in rig: %s", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_1();
}

void CoreIKRig::removeConstraint()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2(&dword_21078E000, v0, v1, "%s: RemoveConstraint: Constraint not found in rig: %s", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_1();
}

void CoreIKRig::removeJoint()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2(&dword_21078E000, v0, v1, "%s: Cannot remove. Joint not found in rig: %s", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_1();
}

{
  NSObject *v0;
  int v1[6];
  uint64_t v2;

  v2 = *MEMORY[0x24BDAC8D0];
  v1[0] = 136315394;
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0(&dword_21078E000, v0, (uint64_t)v0, "%s: Cannot remove. Joint is not a leaf: %s", (uint8_t *)v1);
  OUTLINED_FUNCTION_1();
}

{
  NSObject *v0;
  int v1[6];
  uint64_t v2;

  v2 = *MEMORY[0x24BDAC8D0];
  v1[0] = 136315394;
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0(&dword_21078E000, v0, (uint64_t)v0, "%s: Cannot remove. Joint is not a leaf: %s", (uint8_t *)v1);
  OUTLINED_FUNCTION_1();
}

void validateRigHierarchy<FIK::GameRig>(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_21078E000, a1, a3, "%s: Multiple constraints have the same target.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void CoreIK::createSolverObject<CoreIK::IKSolverGeneric>(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_21078E000, a1, a3, "%s: The requested solver type can't be created from this rig", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void std::__variant_detail::__visitation::__base::__dispatcher<0ul>::__dispatch[abi:nn180100]<std::__variant_detail::__visitation::__variant::__value_visitor<CoreIKRigConstraintPositionAsPoleEnabled::$_0> &&,std::__variant_detail::__base<(std::__variant_detail::_Trait)1,FIK::GameRig,std::__variant_detail::_Trait::MoCapRig> &>(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_21078E000, a1, a3, "%s: Constraint name not in rig", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void CoreIKSolver::setInputScale(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_21078E000, a1, a3, "%s: Trying to set invalid input scale", a5, a6, a7, a8, 2u);
}

void CoreIKSolver::setOutputScale(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_21078E000, a1, a3, "%s: Trying to set invalid output scale", a5, a6, a7, a8, 2u);
}

void CoreIKACPPenetrationSolverGetTargetRestPose_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_21078E000, a1, a3, "%s: No target joint at input targetIndex in rig.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void CoreIK::IKSolverGeneric::despatchGetConstraint(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_21078E000, a1, a3, "%s: The solver does not contain a constraint with the given name", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void CoreIKSolver::despatchSetInputScale(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_21078E000, a1, a3, "%s: Setting of input scale is not supported by this solver", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void CoreIKSolver::despatchSetOutputScale(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_21078E000, a1, a3, "%s: Setting of output scale is not supported by this solver", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void CoreIKSolver::despatchGetConstraintCount(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_21078E000, a1, a3, "%s: Getting constraint count is not supported by this solver", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void CoreIKSolver::despatchGetTaskTargetsDebug(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_21078E000, a1, a3, "%s: Getting task targets is not supported by this solver", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void ikinema::processedRigs::getBPERigObject()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2(&dword_21078E000, v0, v1, "%s: Unknown source joint %s", v2, v3, v4, v5, 2u);
}

{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2(&dword_21078E000, v0, v1, "%s: Unknown target joint %s", v2, v3, v4, v5, 2u);
}

void CoreIKACPSolver::despatchGetConstraint(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_21078E000, a1, a3, "%s: The solver does not containt a constraint with the given name", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void CoreIKACPPenetrationSolver::getConstraint(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_21078E000, a1, a3, "%s: The solver does not contain a constraint with the given name", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

{
  OUTLINED_FUNCTION_0_0(&dword_21078E000, a1, a3, "%s: The solver does not contain a constraint with given index.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void CoreIKSolverInsertAlgorithm_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_21078E000, a1, a3, "%s: Can't add an algorithm to a non-composable solver", a5, a6, a7, a8, 2u);
}

void CoreIKSolverRemoveAlgorithm_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_21078E000, a1, a3, "%s: Can't remove an algorithm from a non-composable solver", a5, a6, a7, a8, 2u);
}

void CoreIK::IKSolverRetarget::despatchGetConstraint(os_log_t log)
{
  int v1;
  const char *v2;
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  v1 = 136315138;
  v2 = "despatchGetConstraint";
  _os_log_error_impl(&dword_21078E000, log, OS_LOG_TYPE_ERROR, "%s: The solver does not contain a constraint with the given name", (uint8_t *)&v1, 0xCu);
}

void CoreIKEnrollmentPoseSolveForDataWithHeadPoseV2_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_21078E000, a1, a3, "%s: Solving all frames at once is only allowed in debug builds.", a5, a6, a7, a8, 2u);
}

void CoreIKEnrollmentPoseSolveForDataWithHeadPoseV3_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_21078E000, a1, a3, "%s: Enrollment Solve: Inputs do not contain all source and/or targets defined in the rig.", a5, a6, a7, a8, 2u);
}

void CoreIKSolverAddAlgorithm_UseRotationFromSource_cold_1(os_log_t log)
{
  int v1;
  const char *v2;
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  v1 = 136315138;
  v2 = "CoreIKSolverAddAlgorithm_UseRotationFromSource";
  _os_log_error_impl(&dword_21078E000, log, OS_LOG_TYPE_ERROR, "%s: Can't add an algorithm to a non-composable solver", (uint8_t *)&v1, 0xCu);
}

void CoreIKGenericSolverCreate_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_21078E000, a1, a3, "%s: Incompatible/invalid rig instance used to create GenericSolver.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void CoreIKGenericSolverSolve_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_21078E000, a1, a3, "%s: Incorrectly sized pose passed to the solve function.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void CoreIKGenericSolverGetConstraintTargetName_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_21078E000, a1, a3, "%s: No constraint at given constraintIndex", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void CoreIKGenericSolverGetTargetRestPose_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_21078E000, a1, a3, "%s: Input target index is out of bounds", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void CoreIKGenericSolverGetConstraintIndex_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_21078E000, a1, a3, "%s: No constraint for input target name in rig.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

CFErrorRef CFErrorCreateWithUserInfoKeysAndValues(CFAllocatorRef allocator, CFErrorDomain domain, CFIndex code, const void *const *userInfoKeys, const void *const *userInfoValues, CFIndex numUserInfoValues)
{
  return (CFErrorRef)MEMORY[0x24BDBBE90](allocator, domain, code, userInfoKeys, userInfoValues, numUserInfoValues);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x24BDBBEF8](cf);
}

CFPropertyListRef CFPreferencesCopyAppValue(CFStringRef key, CFStringRef applicationID)
{
  return (CFPropertyListRef)MEMORY[0x24BDBC160](key, applicationID);
}

CFIndex CFPreferencesGetAppIntegerValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return MEMORY[0x24BDBC190](key, applicationID, keyExistsAndHasValidFormat);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x24BDBC298](cf);
}

CFStringRef CFStringCreateWithCString(CFAllocatorRef alloc, const char *cStr, CFStringEncoding encoding)
{
  return (CFStringRef)MEMORY[0x24BDBC568](alloc, cStr, *(_QWORD *)&encoding);
}

const char *__cdecl CFStringGetCStringPtr(CFStringRef theString, CFStringEncoding encoding)
{
  return (const char *)MEMORY[0x24BDBC610](theString, *(_QWORD *)&encoding);
}

CFTypeID CFStringGetTypeID(void)
{
  return MEMORY[0x24BDBC698]();
}

std::string::size_type std::string::find(const std::string *this, std::string::value_type __c, std::string::size_type __pos)
{
  return MEMORY[0x24BEDA9B0](this, __c, __pos);
}

const std::locale::facet *__cdecl std::locale::use_facet(const std::locale *this, std::locale::id *a2)
{
  return (const std::locale::facet *)MEMORY[0x24BEDAA60](this, a2);
}

std::locale std::ios_base::getloc(const std::ios_base *this)
{
  return (std::locale)MEMORY[0x24BEDAA70](this);
}

std::string *__cdecl std::string::append(std::string *this, const std::string::value_type *__s)
{
  return (std::string *)MEMORY[0x24BEDAC38](this, __s);
}

std::string *__cdecl std::string::append(std::string *this, const std::string::value_type *__s, std::string::size_type __n)
{
  return (std::string *)MEMORY[0x24BEDAC40](this, __s, __n);
}

std::string *__cdecl std::string::basic_string(std::string *this, const std::string *__str, std::string::size_type __pos, std::string::size_type __n, std::allocator<char> *__a)
{
  return (std::string *)MEMORY[0x24BEDACE8](this, __str, __pos, __n, __a);
}

uint64_t std::filebuf::open()
{
  return MEMORY[0x24BEDADD8]();
}

uint64_t std::filebuf::close()
{
  return MEMORY[0x24BEDADE0]();
}

uint64_t std::filebuf::basic_filebuf()
{
  return MEMORY[0x24BEDADE8]();
}

{
  return MEMORY[0x24BEDADF0]();
}

uint64_t std::filebuf::~filebuf()
{
  return MEMORY[0x24BEDADF8]();
}

uint64_t std::istream::sentry::sentry()
{
  return MEMORY[0x24BEDAE50]();
}

uint64_t std::istream::~istream()
{
  return MEMORY[0x24BEDAE70]();
}

uint64_t std::ostream::sentry::sentry()
{
  return MEMORY[0x24BEDAEF8]();
}

uint64_t std::ostream::sentry::~sentry()
{
  return MEMORY[0x24BEDAF00]();
}

uint64_t std::ostream::~ostream()
{
  return MEMORY[0x24BEDAF10]();
}

uint64_t std::ostream::operator<<()
{
  return MEMORY[0x24BEDAF40]();
}

{
  return MEMORY[0x24BEDAF48]();
}

{
  return MEMORY[0x24BEDAF60]();
}

uint64_t std::streambuf::basic_streambuf()
{
  return MEMORY[0x24BEDB048]();
}

uint64_t std::streambuf::~streambuf()
{
  return MEMORY[0x24BEDB050]();
}

void std::__libcpp_verbose_abort(const char *__format, ...)
{
  MEMORY[0x24BEDB1B8](__format);
}

void *__cdecl std::align(size_t __align, size_t __sz, void **__ptr, size_t *__space)
{
  return (void *)MEMORY[0x24BEDB340](__align, __sz, __ptr, __space);
}

std::chrono::system_clock::time_point std::chrono::system_clock::now(void)
{
  return (std::chrono::system_clock::time_point)MEMORY[0x24BEDB3F0]();
}

void std::locale::~locale(std::locale *this)
{
  MEMORY[0x24BEDB448](this);
}

void std::ios_base::init(std::ios_base *this, void *__sb)
{
  MEMORY[0x24BEDB518](this, __sb);
}

void std::ios_base::move(std::ios_base *this, std::ios_base *a2)
{
  MEMORY[0x24BEDB520](this, a2);
}

void std::ios_base::clear(std::ios_base *this, std::ios_base::iostate __state)
{
  MEMORY[0x24BEDB530](this, *(_QWORD *)&__state);
}

uint64_t std::ios::~ios()
{
  return MEMORY[0x24BEDB5E8]();
}

std::string *__cdecl std::to_string(std::string *__return_ptr retstr, double __val)
{
  return (std::string *)MEMORY[0x24BEDB5F8](retstr, __val);
}

void operator delete(void *__p)
{
  off_24CA68838(__p);
}

uint64_t operator delete()
{
  return off_24CA68840();
}

void *__cdecl operator new(size_t __sz)
{
  return (void *)off_24CA68848(__sz);
}

uint64_t operator new()
{
  return off_24CA68850();
}

int __cxa_guard_acquire(__guard *a1)
{
  return MEMORY[0x24BEDB948](a1);
}

void __cxa_guard_release(__guard *a1)
{
  MEMORY[0x24BEDB950](a1);
}

float __exp10f(float a1)
{
  float result;

  MEMORY[0x24BDAC7E0](a1);
  return result;
}

__float2 __sincosf_stret(float a1)
{
  float v1;
  float v2;
  __float2 result;

  MEMORY[0x24BDAC898](a1);
  result.__cosval = v2;
  result.__sinval = v1;
  return result;
}

uint64_t _os_crash_msg()
{
  return MEMORY[0x24BDACB58]();
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB80](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB88](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB90](dso, log, type, format, buf, *(_QWORD *)&size);
}

uint64_t _os_log_send_and_compose_impl()
{
  return MEMORY[0x24BDACBA8]();
}

void abort(void)
{
  MEMORY[0x24BDAD008]();
}

float asinf(float a1)
{
  float result;

  MEMORY[0x24BDAD190](a1);
  return result;
}

float atan2f(float a1, float a2)
{
  float result;

  MEMORY[0x24BDAD228](a1, a2);
  return result;
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x24BDAD320](a1, a2);
}

float cosf(float a1)
{
  float result;

  MEMORY[0x24BDADBE8](a1);
  return result;
}

float expf(float a1)
{
  float result;

  MEMORY[0x24BDAE288](a1);
  return result;
}

int fprintf(FILE *a1, const char *a2, ...)
{
  return MEMORY[0x24BDAE428](a1, a2);
}

void free(void *a1)
{
  MEMORY[0x24BDAE450](a1);
}

size_t fwrite(const void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return MEMORY[0x24BDAE590](__ptr, __size, __nitems, __stream);
}

uint64_t kdebug_trace()
{
  return MEMORY[0x24BDAE958]();
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x24BDAED78](size, type_id);
}

void *__cdecl malloc_type_realloc(void *ptr, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x24BDAED88](ptr, size, type_id);
}

void *__cdecl memchr(void *__s, int __c, size_t __n)
{
  return (void *)MEMORY[0x24BDAEE70](__s, *(_QWORD *)&__c, __n);
}

int memcmp(const void *__s1, const void *__s2, size_t __n)
{
  return MEMORY[0x24BDAEE78](__s1, __s2, __n);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x24BDAEE80](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x24BDAEE98](__dst, __src, __len);
}

void *__cdecl memset(void *__b, int __c, size_t __len)
{
  return (void *)MEMORY[0x24BDAEEA8](__b, *(_QWORD *)&__c, __len);
}

void memset_pattern16(void *__b, const void *__pattern16, size_t __len)
{
  MEMORY[0x24BDAEEB0](__b, __pattern16, __len);
}

int mkdir(const char *a1, mode_t a2)
{
  return MEMORY[0x24BDAEF28](a1, a2);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x24BDAF368](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

long double pow(long double __x, long double __y)
{
  long double result;

  MEMORY[0x24BDAF688](__x, __y);
  return result;
}

int printf(const char *a1, ...)
{
  return MEMORY[0x24BDAF6A8](a1);
}

int putchar(int a1)
{
  return MEMORY[0x24BDAF9F0](*(_QWORD *)&a1);
}

int puts(const char *a1)
{
  return MEMORY[0x24BDAF9F8](a1);
}

float sinf(float a1)
{
  float result;

  MEMORY[0x24BDAFE20](a1);
  return result;
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return MEMORY[0x24BDAFE40](__str, __size, __format);
}

