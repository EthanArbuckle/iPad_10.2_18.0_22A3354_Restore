@implementation AVTPhysicalizedMorpherDynamic

- (NSString)description
{
  void *v3;
  SCNMorpher *writeMorpher;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  writeMorpher = self->_writeMorpher;
  -[SCNNode name](self->_drivingNode, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<AVTPhysicalizedMorpherDynamic: %p> Morpher %p driven by \"%@\"), self, writeMorpher, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

+ (void)enumerateDynamicsInHierarchy:(void *)a3 forAvatar:(void *)a4 ignoredUpperNodes:(void *)a5 usingBlock:
{
  id v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  _QWORD v23[4];
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = a2;
  objc_opt_self();
  objc_msgSend(v8, "avatarNode");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "childNodeWithName:recursively:", CFSTR("head_JNT"), 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "specializationSettings");
  v22 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "objectForKeyedSubscript:", CFSTR("dynamics"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("dynamic nodes"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __101__AVTPhysicalizedMorpherDynamic_enumerateDynamicsInHierarchy_forAvatar_ignoredUpperNodes_usingBlock___block_invoke;
  v23[3] = &unk_1EA61DA28;
  v24 = v9;
  v25 = v12;
  v26 = v15;
  v27 = v13;
  v28 = v8;
  v29 = v10;
  v16 = v10;
  v17 = v8;
  v18 = v13;
  v19 = v15;
  v20 = v12;
  v21 = v9;
  objc_msgSend(v11, "enumerateHierarchyUsingBlock:", v23);

}

void __101__AVTPhysicalizedMorpherDynamic_enumerateDynamicsInHierarchy_forAvatar_ignoredUpperNodes_usingBlock___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  int v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  __int128 v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  NSObject *v33;
  NSObject *v34;
  float v35;
  float v36;
  uint64_t v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  uint64_t v42;
  NSObject *v43;
  __int128 v44;
  id v45;
  id obj;
  uint64_t v47;
  uint64_t v48;
  id v50;
  id v51;
  id v52;
  _QWORD v53[6];
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  uint8_t buf[4];
  void *v63;
  __int16 v64;
  void *v65;
  __int128 v66;
  uint64_t v67;
  uint64_t (*v68)(uint64_t, uint64_t);
  void (*v69)(uint64_t);
  id v70;
  _BYTE v71[128];
  _BYTE v72[128];
  uint64_t v73;

  v73 = *MEMORY[0x1E0C80C00];
  v45 = a2;
  objc_msgSend(v45, "morpher");
  v50 = (id)objc_claimAutoreleasedReturnValue();
  v2 = v50;
  if (v50)
  {
    v3 = objc_msgSend(*(id *)(a1 + 32), "containsObject:", v45);
    v51 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    v58 = 0u;
    v59 = 0u;
    v60 = 0u;
    v61 = 0u;
    objc_msgSend(v50, "targets");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v58, v72, 16);
    if (v5)
    {
      v6 = *(_QWORD *)v59;
      do
      {
        for (i = 0; i != v5; ++i)
        {
          if (*(_QWORD *)v59 != v6)
            objc_enumerationMutation(v4);
          v8 = *(void **)(*((_QWORD *)&v58 + 1) + 8 * i);
          if (v3)
          {
            objc_msgSend(*(id *)(*((_QWORD *)&v58 + 1) + 8 * i), "name");
            v9 = (void *)objc_claimAutoreleasedReturnValue();
            v10 = objc_msgSend(v9, "containsString:", CFSTR("upper"));

            if ((v10 & 1) != 0)
              continue;
          }
          objc_msgSend(v8, "name");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = objc_msgSend(v11, "rangeOfString:", CFSTR("_DYN"));
          v14 = v13;

          if (v12 != 0x7FFFFFFFFFFFFFFFLL)
          {
            objc_msgSend(v8, "name");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "substringToIndex:", v12 + v14);
            v16 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v51, "addObject:", v16);
          }
        }
        v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v58, v72, 16);
      }
      while (v5);
    }

    v56 = 0u;
    v57 = 0u;
    v54 = 0u;
    v55 = 0u;
    obj = v51;
    v48 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v54, v71, 16);
    if (v48)
    {
      v47 = *(_QWORD *)v55;
      *(_QWORD *)&v17 = 138412546;
      v44 = v17;
      while (2)
      {
        v18 = 0;
        do
        {
          if (*(_QWORD *)v55 != v47)
            objc_enumerationMutation(obj);
          v19 = *(void **)(*((_QWORD *)&v54 + 1) + 8 * v18);
          objc_msgSend(*(id *)(a1 + 40), "childNodeWithName:recursively:", v19, 1, v44);
          v52 = (id)objc_claimAutoreleasedReturnValue();
          if (!v52)
          {
            avt_default_log();
            v43 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
            {
              LODWORD(v66) = 138412290;
              *(_QWORD *)((char *)&v66 + 4) = v19;
              _os_log_impl(&dword_1DD1FA000, v43, OS_LOG_TYPE_DEFAULT, "Failed to find physicalized morpher driving node named '%@'", (uint8_t *)&v66, 0xCu);
            }

            goto LABEL_40;
          }
          *(_QWORD *)&v66 = 0;
          *((_QWORD *)&v66 + 1) = &v66;
          v67 = 0x3032000000;
          v68 = __Block_byref_object_copy__0;
          v69 = __Block_byref_object_dispose__0;
          v70 = 0;
          v20 = *(void **)(a1 + 48);
          v53[0] = MEMORY[0x1E0C809B0];
          v53[1] = 3221225472;
          v53[2] = __101__AVTPhysicalizedMorpherDynamic_enumerateDynamicsInHierarchy_forAvatar_ignoredUpperNodes_usingBlock___block_invoke_8;
          v53[3] = &unk_1EA61DA00;
          v53[4] = v19;
          v53[5] = &v66;
          objc_msgSend(v20, "enumerateKeysAndObjectsUsingBlock:", v53);
          objc_msgSend(v19, "stringByAppendingString:", CFSTR("_forward"));
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v22 = objc_msgSend(v50, "_weightIndexForTargetNamed:", v21);

          objc_msgSend(v19, "stringByAppendingString:", CFSTR("_backward"));
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v24 = objc_msgSend(v50, "_weightIndexForTargetNamed:", v23);

          objc_msgSend(v19, "stringByAppendingString:", CFSTR("_leftward"));
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          v26 = objc_msgSend(v50, "_weightIndexForTargetNamed:", v25);

          objc_msgSend(v19, "stringByAppendingString:", CFSTR("_rightward"));
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          v28 = objc_msgSend(v50, "_weightIndexForTargetNamed:", v27);

          objc_msgSend(v19, "stringByAppendingString:", CFSTR("_upward"));
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          v30 = objc_msgSend(v50, "_weightIndexForTargetNamed:", v29);

          objc_msgSend(v19, "stringByAppendingString:", CFSTR("_downward"));
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          v32 = objc_msgSend(v50, "_weightIndexForTargetNamed:", v31);

          if ((v22 == 0x7FFFFFFFFFFFFFFFLL || v24 == 0x7FFFFFFFFFFFFFFFLL)
            && (v26 == 0x7FFFFFFFFFFFFFFFLL || v28 == 0x7FFFFFFFFFFFFFFFLL)
            && (v30 == 0x7FFFFFFFFFFFFFFFLL || v32 == 0x7FFFFFFFFFFFFFFFLL))
          {
            avt_default_log();
            v34 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
            {
              objc_msgSend(v45, "name");
              v41 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = v44;
              v63 = v41;
              v64 = 2112;
              v65 = v19;
              _os_log_impl(&dword_1DD1FA000, v34, OS_LOG_TYPE_DEFAULT, "Failed to create physicalized morpher dynamic: '%@' driven by '%@'", buf, 0x16u);

            }
          }
          else
          {
            objc_msgSend(*(id *)(*((_QWORD *)&v66 + 1) + 40), "objectForKeyedSubscript:", CFSTR("simulation factor"));
            v33 = objc_claimAutoreleasedReturnValue();
            v34 = v33;
            if (v33)
            {
              -[NSObject floatValue](v33, "floatValue");
              v36 = v35;
            }
            else
            {
              v36 = 0.5;
            }
            v37 = objc_opt_new();
            *(float *)(v37 + 8) = v36;
            objc_storeStrong((id *)(v37 + 16), *(id *)(a1 + 56));
            objc_storeStrong((id *)(v37 + 24), v52);
            objc_storeStrong((id *)(v37 + 32), v50);
            *(_QWORD *)(v37 + 40) = v22;
            *(_QWORD *)(v37 + 48) = v24;
            *(_QWORD *)(v37 + 56) = v26;
            *(_QWORD *)(v37 + 64) = v28;
            *(_QWORD *)(v37 + 72) = v30;
            *(_QWORD *)(v37 + 80) = v32;
            objc_msgSend(*(id *)(*((_QWORD *)&v66 + 1) + 40), "objectForKeyedSubscript:", CFSTR("morph target weight as simulation factor"));
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            if (v38)
            {
              objc_msgSend(*(id *)(a1 + 64), "effectiveMorphedNodeForTargetName:", v38);
              v39 = (void *)objc_claimAutoreleasedReturnValue();
              objc_storeStrong((id *)(v37 + 88), v39);
              objc_msgSend(v39, "morpher");
              v40 = (void *)objc_claimAutoreleasedReturnValue();
              *(_QWORD *)(v37 + 96) = objc_msgSend(v40, "_weightIndexForTargetNamed:", v38);

            }
            (*(void (**)(void))(*(_QWORD *)(a1 + 72) + 16))();

          }
          _Block_object_dispose(&v66, 8);

          ++v18;
        }
        while (v48 != v18);
        v42 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v54, v71, 16);
        v48 = v42;
        if (v42)
          continue;
        break;
      }
    }
LABEL_40:

    v2 = v50;
  }

}

void __101__AVTPhysicalizedMorpherDynamic_enumerateDynamicsInHierarchy_forAvatar_ignoredUpperNodes_usingBlock___block_invoke_8(uint64_t a1, uint64_t a2, void *a3, _BYTE *a4)
{
  id v8;

  v8 = a3;
  if (objc_msgSend(*(id *)(a1 + 32), "containsString:", a2))
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a3);
    *a4 = 1;
  }

}

- (void)evaluateAtTime:(double)a3 physicsController:(id)a4
{
  SCNNode *v5;
  SCNNode *v6;
  void *v7;
  void *v8;
  double v9;
  float v10;
  float32x4_t v11;
  float32x4_t v12;
  float32x4_t v13;
  float32x4_t v14;
  float32x4_t v15;
  SCNMorpher *v16;
  SCNMorpher *v17;
  float32x4_t v18;
  float32x4_t v19;
  id v20;
  float simulationFactor;
  float32x4_t v22;

  v20 = a4;
  simulationFactor = self->_simulationFactor;
  v5 = self->_extraSimulationFactorReadMorpherNode;
  v6 = v5;
  if (v5)
  {
    -[SCNNode presentationNode](v5, "presentationNode");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "morpher");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "weightForTargetAtIndex:", self->_extraSimulationFactorTargetIndex);
    v10 = v9;

    simulationFactor = simulationFactor * v10;
  }
  objc_msgSend(v20, "offsetFromRestingPositionForNode:inCoordinateSpaceOfNode:", self->_drivingNode, self->_referenceNode);
  v12 = vmulq_n_f32(v11, simulationFactor);
  v13 = vnegq_f32(v12);
  v12.i32[3] = 0;
  v14 = vmaxnmq_f32(v12, (float32x4_t)0);
  v14.i32[3] = 0;
  v22 = vminnmq_f32(v14, (float32x4_t)xmmword_1DD269FE0);
  v13.i32[3] = 0;
  v15 = vmaxnmq_f32(v13, (float32x4_t)0);
  v15.i32[3] = 0;
  v18 = v15;
  v16 = self->_writeMorpher;
  v17 = v16;
  if (self->_leftwardMorphTargetIndex != 0x7FFFFFFFFFFFFFFFLL)
    -[SCNMorpher setWeight:forTargetAtIndex:](v16, "setWeight:forTargetAtIndex:", v22.f32[0]);
  v19 = vminnmq_f32(v18, (float32x4_t)xmmword_1DD269FE0);
  if (self->_rightwardMorphTargetIndex != 0x7FFFFFFFFFFFFFFFLL)
    -[SCNMorpher setWeight:forTargetAtIndex:](v17, "setWeight:forTargetAtIndex:", v19.f32[0]);
  if (self->_forwardMorphTargetIndex != 0x7FFFFFFFFFFFFFFFLL)
    -[SCNMorpher setWeight:forTargetAtIndex:](v17, "setWeight:forTargetAtIndex:", v22.f32[2]);
  if (self->_backwardMorphTargetIndex != 0x7FFFFFFFFFFFFFFFLL)
    -[SCNMorpher setWeight:forTargetAtIndex:](v17, "setWeight:forTargetAtIndex:", v19.f32[2]);
  if (self->_upwardMorphTargetIndex != 0x7FFFFFFFFFFFFFFFLL)
    -[SCNMorpher setWeight:forTargetAtIndex:](v17, "setWeight:forTargetAtIndex:", v22.f32[1]);
  if (self->_downwardMorphTargetIndex != 0x7FFFFFFFFFFFFFFFLL)
    -[SCNMorpher setWeight:forTargetAtIndex:](v17, "setWeight:forTargetAtIndex:", v19.f32[1]);

}

- (void)resetTarget
{
  if (self->_leftwardMorphTargetIndex != 0x7FFFFFFFFFFFFFFFLL)
    -[SCNMorpher setWeight:forTargetAtIndex:](self->_writeMorpher, "setWeight:forTargetAtIndex:", 0.0);
  if (self->_rightwardMorphTargetIndex != 0x7FFFFFFFFFFFFFFFLL)
    -[SCNMorpher setWeight:forTargetAtIndex:](self->_writeMorpher, "setWeight:forTargetAtIndex:", 0.0);
  if (self->_forwardMorphTargetIndex != 0x7FFFFFFFFFFFFFFFLL)
    -[SCNMorpher setWeight:forTargetAtIndex:](self->_writeMorpher, "setWeight:forTargetAtIndex:", 0.0);
  if (self->_backwardMorphTargetIndex != 0x7FFFFFFFFFFFFFFFLL)
    -[SCNMorpher setWeight:forTargetAtIndex:](self->_writeMorpher, "setWeight:forTargetAtIndex:", 0.0);
  if (self->_upwardMorphTargetIndex != 0x7FFFFFFFFFFFFFFFLL)
    -[SCNMorpher setWeight:forTargetAtIndex:](self->_writeMorpher, "setWeight:forTargetAtIndex:", 0.0);
  if (self->_downwardMorphTargetIndex != 0x7FFFFFFFFFFFFFFFLL)
    -[SCNMorpher setWeight:forTargetAtIndex:](self->_writeMorpher, "setWeight:forTargetAtIndex:", 0.0);
}

- (BOOL)affectsNode:(id)a3
{
  SCNMorpher *v4;

  objc_msgSend(a3, "morpher");
  v4 = (SCNMorpher *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = v4 == self->_writeMorpher;

  return (char)self;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_extraSimulationFactorReadMorpherNode, 0);
  objc_storeStrong((id *)&self->_writeMorpher, 0);
  objc_storeStrong((id *)&self->_drivingNode, 0);
  objc_storeStrong((id *)&self->_referenceNode, 0);
}

@end
