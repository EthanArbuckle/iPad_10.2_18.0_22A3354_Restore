@implementation LNSystemProtocol

void __46__LNSystemProtocol_focusConfigurationProtocol__block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;

  +[LNSystemProtocol allProtocolsByIdentifier](LNSystemProtocol, "allProtocolsByIdentifier");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "valueForKey:", CFSTR("com.apple.link.systemProtocol.FocusConfiguration"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)focusConfigurationProtocol_value;
  focusConfigurationProtocol_value = v0;

}

+ (id)protocolOrNilWithIdentifier:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v10;
  uint8_t buf[4];
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("LNSystemProtocol.m"), 497, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("identifier"));

  }
  objc_msgSend(a1, "allProtocolsByIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "valueForKey:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    getLNLogCategoryExecution();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v12 = v5;
      _os_log_impl(&dword_19A9C7000, v8, OS_LOG_TYPE_ERROR, "%{public}@ is not a valid LN_TYPE(SystemProtocolIdentifier)", buf, 0xCu);
    }

  }
  return v7;
}

+ (id)allProtocolsByIdentifier
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __44__LNSystemProtocol_allProtocolsByIdentifier__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (allProtocolsByIdentifier_onceToken_6764 != -1)
    dispatch_once(&allProtocolsByIdentifier_onceToken_6764, block);
  return (id)allProtocolsByIdentifier_protocolsByIdentifier_6765;
}

+ (LNSystemProtocol)audioStartingProtocol
{
  if (audioStartingProtocol_onceToken != -1)
    dispatch_once(&audioStartingProtocol_onceToken, &__block_literal_global_6770);
  return (LNSystemProtocol *)(id)audioStartingProtocol_value;
}

+ (LNSystemProtocol)audioRecordingProtocol
{
  if (audioRecordingProtocol_onceToken != -1)
    dispatch_once(&audioRecordingProtocol_onceToken, &__block_literal_global_124);
  return (LNSystemProtocol *)(id)audioRecordingProtocol_value;
}

void __44__LNSystemProtocol_allProtocolsByIdentifier__block_invoke()
{
  LNSystemProtocol *v0;
  LNSystemProtocol *v1;
  LNSystemProtocol *v2;
  LNSystemProtocol *v3;
  LNSystemProtocol *v4;
  LNSystemProtocol *v5;
  LNSystemProtocol *v6;
  LNSystemProtocol *v7;
  LNSystemProtocol *v8;
  LNSystemProtocol *v9;
  LNSystemProtocol *v10;
  LNSystemProtocol *v11;
  LNSystemProtocol *v12;
  LNSystemProtocol *v13;
  LNSystemProtocol *v14;
  LNSystemProtocol *v15;
  LNSystemProtocol *v16;
  LNSystemProtocol *v17;
  LNSystemProtocol *v18;
  LNSystemProtocol *v19;
  LNSystemProtocol *v20;
  LNSystemProtocol *v21;
  LNSystemProtocol *v22;
  LNSystemProtocol *v23;
  LNSystemProtocol *v24;
  LNSystemProtocol *v25;
  LNSystemProtocol *v26;
  LNSystemProtocol *v27;
  LNSystemProtocol *v28;
  LNSystemProtocol *v29;
  LNSystemProtocol *v30;
  LNSystemProtocol *v31;
  LNSystemProtocol *v32;
  LNSystemProtocol *v33;
  LNSystemProtocol *v34;
  LNSystemProtocol *v35;
  LNSystemProtocol *v36;
  LNSystemProtocol *v37;
  LNSystemProtocol *v38;
  LNSystemProtocol *v39;
  LNSystemProtocol *v40;
  LNSystemProtocol *v41;
  LNSystemProtocol *v42;
  LNSystemProtocol *v43;
  LNSystemProtocol *v44;
  LNSystemProtocol *v45;
  LNSystemProtocol *v46;
  LNSystemProtocol *v47;
  LNSystemProtocol *v48;
  LNSystemProtocol *v49;
  LNSystemProtocol *v50;
  LNSystemProtocol *v51;
  LNSystemProtocol *v52;
  LNSystemProtocol *v53;
  LNSystemProtocol *v54;
  LNSystemProtocol *v55;
  LNSystemProtocol *v56;
  LNSystemProtocol *v57;
  LNSystemProtocol *v58;
  LNSystemProtocol *v59;
  void *v60;
  LNSystemProtocol *v61;
  LNSystemProtocol *v62;
  void *v63;
  LNSystemProtocol *v64;
  LNSystemProtocol *v65;
  void *v66;
  LNSystemProtocol *v67;
  LNSystemProtocol *v68;
  void *v69;
  LNSystemProtocol *v70;
  uint64_t v71;
  void *v72;
  void *v73;
  LNSystemProtocol *v74;
  void *v75;
  LNSystemProtocol *v76;
  void *v77;
  LNSystemProtocol *v78;
  void *v79;
  LNSystemProtocol *v80;
  void *v81;
  LNSystemProtocol *v82;
  void *v83;
  LNSystemProtocol *v84;
  void *v85;
  LNSystemProtocol *v86;
  void *v87;
  LNSystemProtocol *v88;
  void *v89;
  LNSystemProtocol *v90;
  void *v91;
  LNSystemProtocol *v92;
  void *v93;
  LNSystemProtocol *v94;
  void *v95;
  LNSystemProtocol *v96;
  void *v97;
  LNSystemProtocol *v98;
  void *v99;
  LNSystemProtocol *v100;
  void *v101;
  LNSystemProtocol *v102;
  void *v103;
  LNSystemProtocol *v104;
  void *v105;
  LNSystemProtocol *v106;
  void *v107;
  LNSystemProtocol *v108;
  void *v109;
  LNSystemProtocol *v110;
  void *v111;
  LNSystemProtocol *v112;
  void *v113;
  LNSystemProtocol *v114;
  void *v115;
  LNSystemProtocol *v116;
  void *v117;
  LNSystemProtocol *v118;
  void *v119;
  LNSystemProtocol *v120;
  void *v121;
  LNSystemProtocol *v122;
  void *v123;
  LNSystemProtocol *v124;
  void *v125;
  LNSystemProtocol *v126;
  void *v127;
  LNSystemProtocol *v128;
  void *v129;
  LNSystemProtocol *v130;
  void *v131;
  LNSystemProtocol *v132;
  void *v133;
  LNSystemProtocol *v134;
  void *v135;
  LNSystemProtocol *v136;
  void *v137;
  LNSystemProtocol *v138;
  void *v139;
  LNSystemProtocol *v140;
  void *v141;
  LNSystemProtocol *v142;
  void *v143;
  LNSystemProtocol *v144;
  void *v145;
  LNSystemProtocol *v146;
  void *v147;
  LNSystemProtocol *v148;
  void *v149;
  LNSystemProtocol *v150;
  void *v151;
  LNSystemProtocol *v152;
  void *v153;
  LNSystemProtocol *v154;
  void *v155;
  LNSystemProtocol *v156;
  void *v157;
  LNSystemProtocol *v158;
  void *v159;
  LNSystemProtocol *v160;
  void *v161;
  LNSystemProtocol *v162;
  void *v163;
  LNSystemProtocol *v164;
  void *v165;
  LNSystemProtocol *v166;
  void *v167;
  LNSystemProtocol *v168;
  void *v169;
  LNSystemProtocol *v170;
  void *v171;
  LNSystemProtocol *v172;
  void *v173;
  LNSystemProtocol *v174;
  void *v175;
  LNSystemProtocol *v176;
  void *v177;
  LNSystemProtocol *v178;
  void *v179;
  LNSystemProtocol *v180;
  void *v181;
  LNSystemProtocol *v182;
  void *v183;
  LNSystemProtocol *v184;
  void *v185;
  LNSystemProtocol *v186;
  void *v187;
  _QWORD v188[62];
  _QWORD v189[64];

  v189[62] = *MEMORY[0x1E0C80C00];
  v188[0] = CFSTR("com.apple.link.systemProtocol.AudioRecording");
  v0 = [LNSystemProtocol alloc];
  objc_msgSend((id)objc_opt_class(), "parametersForProtocolWithIdentifier:", CFSTR("com.apple.link.systemProtocol.AudioRecording"));
  v187 = (void *)objc_claimAutoreleasedReturnValue();
  v186 = -[LNSystemProtocol initWithIdentifier:parameters:](v0, "initWithIdentifier:parameters:", CFSTR("com.apple.link.systemProtocol.AudioRecording"), v187);
  v189[0] = v186;
  v188[1] = CFSTR("com.apple.link.systemProtocol.AudioStarting");
  v1 = [LNSystemProtocol alloc];
  objc_msgSend((id)objc_opt_class(), "parametersForProtocolWithIdentifier:", CFSTR("com.apple.link.systemProtocol.AudioStarting"));
  v185 = (void *)objc_claimAutoreleasedReturnValue();
  v184 = -[LNSystemProtocol initWithIdentifier:parameters:](v1, "initWithIdentifier:parameters:", CFSTR("com.apple.link.systemProtocol.AudioStarting"), v185);
  v189[1] = v184;
  v188[2] = CFSTR("com.apple.link.systemProtocol.Cancel");
  v2 = [LNSystemProtocol alloc];
  objc_msgSend((id)objc_opt_class(), "parametersForProtocolWithIdentifier:", CFSTR("com.apple.link.systemProtocol.Cancel"));
  v183 = (void *)objc_claimAutoreleasedReturnValue();
  v182 = -[LNSystemProtocol initWithIdentifier:parameters:](v2, "initWithIdentifier:parameters:", CFSTR("com.apple.link.systemProtocol.Cancel"), v183);
  v189[2] = v182;
  v188[3] = CFSTR("com.apple.link.systemProtocol.ChangeBinarySetting");
  v3 = [LNSystemProtocol alloc];
  objc_msgSend((id)objc_opt_class(), "parametersForProtocolWithIdentifier:", CFSTR("com.apple.link.systemProtocol.ChangeBinarySetting"));
  v181 = (void *)objc_claimAutoreleasedReturnValue();
  v180 = -[LNSystemProtocol initWithIdentifier:parameters:](v3, "initWithIdentifier:parameters:", CFSTR("com.apple.link.systemProtocol.ChangeBinarySetting"), v181);
  v189[3] = v180;
  v188[4] = CFSTR("com.apple.link.systemProtocol.CloseEntity");
  v4 = [LNSystemProtocol alloc];
  objc_msgSend((id)objc_opt_class(), "parametersForProtocolWithIdentifier:", CFSTR("com.apple.link.systemProtocol.CloseEntity"));
  v179 = (void *)objc_claimAutoreleasedReturnValue();
  v178 = -[LNSystemProtocol initWithIdentifier:parameters:](v4, "initWithIdentifier:parameters:", CFSTR("com.apple.link.systemProtocol.CloseEntity"), v179);
  v189[4] = v178;
  v188[5] = CFSTR("com.apple.link.systemProtocol.ConditionallyEnabled");
  v5 = [LNSystemProtocol alloc];
  objc_msgSend((id)objc_opt_class(), "parametersForProtocolWithIdentifier:", CFSTR("com.apple.link.systemProtocol.ConditionallyEnabled"));
  v177 = (void *)objc_claimAutoreleasedReturnValue();
  v176 = -[LNSystemProtocol initWithIdentifier:parameters:](v5, "initWithIdentifier:parameters:", CFSTR("com.apple.link.systemProtocol.ConditionallyEnabled"), v177);
  v189[5] = v176;
  v188[6] = CFSTR("com.apple.link.systemProtocol.ControlConfiguration");
  v6 = [LNSystemProtocol alloc];
  objc_msgSend((id)objc_opt_class(), "parametersForProtocolWithIdentifier:", CFSTR("com.apple.link.systemProtocol.ControlConfiguration"));
  v175 = (void *)objc_claimAutoreleasedReturnValue();
  v174 = -[LNSystemProtocol initWithIdentifier:parameters:](v6, "initWithIdentifier:parameters:", CFSTR("com.apple.link.systemProtocol.ControlConfiguration"), v175);
  v189[6] = v174;
  v188[7] = CFSTR("com.apple.link.systemProtocol.Copy");
  v7 = [LNSystemProtocol alloc];
  objc_msgSend((id)objc_opt_class(), "parametersForProtocolWithIdentifier:", CFSTR("com.apple.link.systemProtocol.Copy"));
  v173 = (void *)objc_claimAutoreleasedReturnValue();
  v172 = -[LNSystemProtocol initWithIdentifier:parameters:](v7, "initWithIdentifier:parameters:", CFSTR("com.apple.link.systemProtocol.Copy"), v173);
  v189[7] = v172;
  v188[8] = CFSTR("com.apple.link.systemProtocol.CopyEntity");
  v8 = [LNSystemProtocol alloc];
  objc_msgSend((id)objc_opt_class(), "parametersForProtocolWithIdentifier:", CFSTR("com.apple.link.systemProtocol.CopyEntity"));
  v171 = (void *)objc_claimAutoreleasedReturnValue();
  v170 = -[LNSystemProtocol initWithIdentifier:parameters:](v8, "initWithIdentifier:parameters:", CFSTR("com.apple.link.systemProtocol.CopyEntity"), v171);
  v189[8] = v170;
  v188[9] = CFSTR("com.apple.link.systemProtocol.CreateEntity");
  v9 = [LNSystemProtocol alloc];
  objc_msgSend((id)objc_opt_class(), "parametersForProtocolWithIdentifier:", CFSTR("com.apple.link.systemProtocol.CreateEntity"));
  v169 = (void *)objc_claimAutoreleasedReturnValue();
  v168 = -[LNSystemProtocol initWithIdentifier:parameters:](v9, "initWithIdentifier:parameters:", CFSTR("com.apple.link.systemProtocol.CreateEntity"), v169);
  v189[9] = v168;
  v188[10] = CFSTR("com.apple.link.systemProtocol.Cut");
  v10 = [LNSystemProtocol alloc];
  objc_msgSend((id)objc_opt_class(), "parametersForProtocolWithIdentifier:", CFSTR("com.apple.link.systemProtocol.Cut"));
  v167 = (void *)objc_claimAutoreleasedReturnValue();
  v166 = -[LNSystemProtocol initWithIdentifier:parameters:](v10, "initWithIdentifier:parameters:", CFSTR("com.apple.link.systemProtocol.Cut"), v167);
  v189[10] = v166;
  v188[11] = CFSTR("com.apple.link.systemProtocol.CutEntity");
  v11 = [LNSystemProtocol alloc];
  objc_msgSend((id)objc_opt_class(), "parametersForProtocolWithIdentifier:", CFSTR("com.apple.link.systemProtocol.CutEntity"));
  v165 = (void *)objc_claimAutoreleasedReturnValue();
  v164 = -[LNSystemProtocol initWithIdentifier:parameters:](v11, "initWithIdentifier:parameters:", CFSTR("com.apple.link.systemProtocol.CutEntity"), v165);
  v189[11] = v164;
  v188[12] = CFSTR("com.apple.link.systemProtocol.DeleteEntity");
  v12 = [LNSystemProtocol alloc];
  objc_msgSend((id)objc_opt_class(), "parametersForProtocolWithIdentifier:", CFSTR("com.apple.link.systemProtocol.DeleteEntity"));
  v163 = (void *)objc_claimAutoreleasedReturnValue();
  v162 = -[LNSystemProtocol initWithIdentifier:parameters:](v12, "initWithIdentifier:parameters:", CFSTR("com.apple.link.systemProtocol.DeleteEntity"), v163);
  v189[12] = v162;
  v188[13] = CFSTR("com.apple.link.systemProtocol.DuplicateEntity");
  v13 = [LNSystemProtocol alloc];
  objc_msgSend((id)objc_opt_class(), "parametersForProtocolWithIdentifier:", CFSTR("com.apple.link.systemProtocol.DuplicateEntity"));
  v161 = (void *)objc_claimAutoreleasedReturnValue();
  v160 = -[LNSystemProtocol initWithIdentifier:parameters:](v13, "initWithIdentifier:parameters:", CFSTR("com.apple.link.systemProtocol.DuplicateEntity"), v161);
  v189[13] = v160;
  v188[14] = CFSTR("com.apple.link.systemProtocol.EnterMarkup");
  v14 = [LNSystemProtocol alloc];
  objc_msgSend((id)objc_opt_class(), "parametersForProtocolWithIdentifier:", CFSTR("com.apple.link.systemProtocol.EnterMarkup"));
  v159 = (void *)objc_claimAutoreleasedReturnValue();
  v158 = -[LNSystemProtocol initWithIdentifier:parameters:](v14, "initWithIdentifier:parameters:", CFSTR("com.apple.link.systemProtocol.EnterMarkup"), v159);
  v189[14] = v158;
  v188[15] = CFSTR("com.apple.link.systemProtocol.EntityUpdating");
  v15 = [LNSystemProtocol alloc];
  objc_msgSend((id)objc_opt_class(), "parametersForProtocolWithIdentifier:", CFSTR("com.apple.link.systemProtocol.EntityUpdating"));
  v157 = (void *)objc_claimAutoreleasedReturnValue();
  v156 = -[LNSystemProtocol initWithIdentifier:parameters:](v15, "initWithIdentifier:parameters:", CFSTR("com.apple.link.systemProtocol.EntityUpdating"), v157);
  v189[15] = v156;
  v188[16] = CFSTR("com.apple.link.systemProtocol.ExitMarkup");
  v16 = [LNSystemProtocol alloc];
  objc_msgSend((id)objc_opt_class(), "parametersForProtocolWithIdentifier:", CFSTR("com.apple.link.systemProtocol.ExitMarkup"));
  v155 = (void *)objc_claimAutoreleasedReturnValue();
  v154 = -[LNSystemProtocol initWithIdentifier:parameters:](v16, "initWithIdentifier:parameters:", CFSTR("com.apple.link.systemProtocol.ExitMarkup"), v155);
  v189[16] = v154;
  v188[17] = CFSTR("com.apple.link.systemProtocol.FavoriteEntity");
  v17 = [LNSystemProtocol alloc];
  objc_msgSend((id)objc_opt_class(), "parametersForProtocolWithIdentifier:", CFSTR("com.apple.link.systemProtocol.FavoriteEntity"));
  v153 = (void *)objc_claimAutoreleasedReturnValue();
  v152 = -[LNSystemProtocol initWithIdentifier:parameters:](v17, "initWithIdentifier:parameters:", CFSTR("com.apple.link.systemProtocol.FavoriteEntity"), v153);
  v189[17] = v152;
  v188[18] = CFSTR("com.apple.link.systemProtocol.FocusConfiguration");
  v18 = [LNSystemProtocol alloc];
  objc_msgSend((id)objc_opt_class(), "parametersForProtocolWithIdentifier:", CFSTR("com.apple.link.systemProtocol.FocusConfiguration"));
  v151 = (void *)objc_claimAutoreleasedReturnValue();
  v150 = -[LNSystemProtocol initWithIdentifier:parameters:](v18, "initWithIdentifier:parameters:", CFSTR("com.apple.link.systemProtocol.FocusConfiguration"), v151);
  v189[18] = v150;
  v188[19] = CFSTR("com.apple.link.systemProtocol.ForegroundContinuable");
  v19 = [LNSystemProtocol alloc];
  objc_msgSend((id)objc_opt_class(), "parametersForProtocolWithIdentifier:", CFSTR("com.apple.link.systemProtocol.ForegroundContinuable"));
  v149 = (void *)objc_claimAutoreleasedReturnValue();
  v148 = -[LNSystemProtocol initWithIdentifier:parameters:](v19, "initWithIdentifier:parameters:", CFSTR("com.apple.link.systemProtocol.ForegroundContinuable"), v149);
  v189[19] = v148;
  v188[20] = CFSTR("com.apple.link.systemProtocol.MoveSpatial");
  v20 = [LNSystemProtocol alloc];
  objc_msgSend((id)objc_opt_class(), "parametersForProtocolWithIdentifier:", CFSTR("com.apple.link.systemProtocol.MoveSpatial"));
  v147 = (void *)objc_claimAutoreleasedReturnValue();
  v146 = -[LNSystemProtocol initWithIdentifier:parameters:](v20, "initWithIdentifier:parameters:", CFSTR("com.apple.link.systemProtocol.MoveSpatial"), v147);
  v189[20] = v146;
  v188[21] = CFSTR("com.apple.link.systemProtocol.NavigateSequentially");
  v21 = [LNSystemProtocol alloc];
  objc_msgSend((id)objc_opt_class(), "parametersForProtocolWithIdentifier:", CFSTR("com.apple.link.systemProtocol.NavigateSequentially"));
  v145 = (void *)objc_claimAutoreleasedReturnValue();
  v144 = -[LNSystemProtocol initWithIdentifier:parameters:](v21, "initWithIdentifier:parameters:", CFSTR("com.apple.link.systemProtocol.NavigateSequentially"), v145);
  v189[21] = v144;
  v188[22] = CFSTR("com.apple.link.systemProtocol.OpenEntity");
  v22 = [LNSystemProtocol alloc];
  objc_msgSend((id)objc_opt_class(), "parametersForProtocolWithIdentifier:", CFSTR("com.apple.link.systemProtocol.OpenEntity"));
  v143 = (void *)objc_claimAutoreleasedReturnValue();
  v142 = -[LNSystemProtocol initWithIdentifier:parameters:](v22, "initWithIdentifier:parameters:", CFSTR("com.apple.link.systemProtocol.OpenEntity"), v143);
  v189[22] = v142;
  v188[23] = CFSTR("com.apple.link.systemProtocol.Paste");
  v23 = [LNSystemProtocol alloc];
  objc_msgSend((id)objc_opt_class(), "parametersForProtocolWithIdentifier:", CFSTR("com.apple.link.systemProtocol.Paste"));
  v141 = (void *)objc_claimAutoreleasedReturnValue();
  v140 = -[LNSystemProtocol initWithIdentifier:parameters:](v23, "initWithIdentifier:parameters:", CFSTR("com.apple.link.systemProtocol.Paste"), v141);
  v189[23] = v140;
  v188[24] = CFSTR("com.apple.link.systemProtocol.PauseWorkout");
  v24 = [LNSystemProtocol alloc];
  objc_msgSend((id)objc_opt_class(), "parametersForProtocolWithIdentifier:", CFSTR("com.apple.link.systemProtocol.PauseWorkout"));
  v139 = (void *)objc_claimAutoreleasedReturnValue();
  v138 = -[LNSystemProtocol initWithIdentifier:parameters:](v24, "initWithIdentifier:parameters:", CFSTR("com.apple.link.systemProtocol.PauseWorkout"), v139);
  v189[24] = v138;
  v188[25] = CFSTR("com.apple.link.systemProtocol.ProgressReporting");
  v25 = [LNSystemProtocol alloc];
  objc_msgSend((id)objc_opt_class(), "parametersForProtocolWithIdentifier:", CFSTR("com.apple.link.systemProtocol.ProgressReporting"));
  v137 = (void *)objc_claimAutoreleasedReturnValue();
  v136 = -[LNSystemProtocol initWithIdentifier:parameters:](v25, "initWithIdentifier:parameters:", CFSTR("com.apple.link.systemProtocol.ProgressReporting"), v137);
  v189[25] = v136;
  v188[26] = CFSTR("com.apple.link.systemProtocol.PreviewEntity");
  v26 = [LNSystemProtocol alloc];
  objc_msgSend((id)objc_opt_class(), "parametersForProtocolWithIdentifier:", CFSTR("com.apple.link.systemProtocol.PreviewEntity"));
  v135 = (void *)objc_claimAutoreleasedReturnValue();
  v134 = -[LNSystemProtocol initWithIdentifier:parameters:](v26, "initWithIdentifier:parameters:", CFSTR("com.apple.link.systemProtocol.PreviewEntity"), v135);
  v189[26] = v134;
  v188[27] = CFSTR("com.apple.link.systemProtocol.PropertyUpdater");
  v27 = [LNSystemProtocol alloc];
  objc_msgSend((id)objc_opt_class(), "parametersForProtocolWithIdentifier:", CFSTR("com.apple.link.systemProtocol.PropertyUpdater"));
  v133 = (void *)objc_claimAutoreleasedReturnValue();
  v132 = -[LNSystemProtocol initWithIdentifier:parameters:](v27, "initWithIdentifier:parameters:", CFSTR("com.apple.link.systemProtocol.PropertyUpdater"), v133);
  v189[27] = v132;
  v188[28] = CFSTR("com.apple.link.systemProtocol.PushToTalkTransmission");
  v28 = [LNSystemProtocol alloc];
  objc_msgSend((id)objc_opt_class(), "parametersForProtocolWithIdentifier:", CFSTR("com.apple.link.systemProtocol.PushToTalkTransmission"));
  v131 = (void *)objc_claimAutoreleasedReturnValue();
  v130 = -[LNSystemProtocol initWithIdentifier:parameters:](v28, "initWithIdentifier:parameters:", CFSTR("com.apple.link.systemProtocol.PushToTalkTransmission"), v131);
  v189[28] = v130;
  v188[29] = CFSTR("com.apple.link.systemProtocol.PutEntityInContainer");
  v29 = [LNSystemProtocol alloc];
  objc_msgSend((id)objc_opt_class(), "parametersForProtocolWithIdentifier:", CFSTR("com.apple.link.systemProtocol.PutEntityInContainer"));
  v129 = (void *)objc_claimAutoreleasedReturnValue();
  v128 = -[LNSystemProtocol initWithIdentifier:parameters:](v29, "initWithIdentifier:parameters:", CFSTR("com.apple.link.systemProtocol.PutEntityInContainer"), v129);
  v189[29] = v128;
  v188[30] = CFSTR("com.apple.link.systemProtocol.RequiresMDMChecks");
  v30 = [LNSystemProtocol alloc];
  objc_msgSend((id)objc_opt_class(), "parametersForProtocolWithIdentifier:", CFSTR("com.apple.link.systemProtocol.RequiresMDMChecks"));
  v127 = (void *)objc_claimAutoreleasedReturnValue();
  v126 = -[LNSystemProtocol initWithIdentifier:parameters:](v30, "initWithIdentifier:parameters:", CFSTR("com.apple.link.systemProtocol.RequiresMDMChecks"), v127);
  v189[30] = v126;
  v188[31] = CFSTR("com.apple.link.systemProtocol.Resize");
  v31 = [LNSystemProtocol alloc];
  objc_msgSend((id)objc_opt_class(), "parametersForProtocolWithIdentifier:", CFSTR("com.apple.link.systemProtocol.Resize"));
  v125 = (void *)objc_claimAutoreleasedReturnValue();
  v124 = -[LNSystemProtocol initWithIdentifier:parameters:](v31, "initWithIdentifier:parameters:", CFSTR("com.apple.link.systemProtocol.Resize"), v125);
  v189[31] = v124;
  v188[32] = CFSTR("com.apple.link.systemProtocol.ResumeWorkout");
  v32 = [LNSystemProtocol alloc];
  objc_msgSend((id)objc_opt_class(), "parametersForProtocolWithIdentifier:", CFSTR("com.apple.link.systemProtocol.ResumeWorkout"));
  v123 = (void *)objc_claimAutoreleasedReturnValue();
  v122 = -[LNSystemProtocol initWithIdentifier:parameters:](v32, "initWithIdentifier:parameters:", CFSTR("com.apple.link.systemProtocol.ResumeWorkout"), v123);
  v189[32] = v122;
  v188[33] = CFSTR("com.apple.link.systemProtocol.SaveEntity");
  v33 = [LNSystemProtocol alloc];
  objc_msgSend((id)objc_opt_class(), "parametersForProtocolWithIdentifier:", CFSTR("com.apple.link.systemProtocol.SaveEntity"));
  v121 = (void *)objc_claimAutoreleasedReturnValue();
  v120 = -[LNSystemProtocol initWithIdentifier:parameters:](v33, "initWithIdentifier:parameters:", CFSTR("com.apple.link.systemProtocol.SaveEntity"), v121);
  v189[33] = v120;
  v188[34] = CFSTR("com.apple.link.systemProtocol.Scroll");
  v34 = [LNSystemProtocol alloc];
  objc_msgSend((id)objc_opt_class(), "parametersForProtocolWithIdentifier:", CFSTR("com.apple.link.systemProtocol.Scroll"));
  v119 = (void *)objc_claimAutoreleasedReturnValue();
  v118 = -[LNSystemProtocol initWithIdentifier:parameters:](v34, "initWithIdentifier:parameters:", CFSTR("com.apple.link.systemProtocol.Scroll"), v119);
  v189[34] = v118;
  v188[35] = CFSTR("com.apple.link.systemProtocol.Search");
  v35 = [LNSystemProtocol alloc];
  objc_msgSend((id)objc_opt_class(), "parametersForProtocolWithIdentifier:", CFSTR("com.apple.link.systemProtocol.Search"));
  v117 = (void *)objc_claimAutoreleasedReturnValue();
  v116 = -[LNSystemProtocol initWithIdentifier:parameters:](v35, "initWithIdentifier:parameters:", CFSTR("com.apple.link.systemProtocol.Search"), v117);
  v189[35] = v116;
  v188[36] = CFSTR("com.apple.link.systemProtocol.SessionStarting");
  v36 = [LNSystemProtocol alloc];
  objc_msgSend((id)objc_opt_class(), "parametersForProtocolWithIdentifier:", CFSTR("com.apple.link.systemProtocol.SessionStarting"));
  v115 = (void *)objc_claimAutoreleasedReturnValue();
  v114 = -[LNSystemProtocol initWithIdentifier:parameters:](v36, "initWithIdentifier:parameters:", CFSTR("com.apple.link.systemProtocol.SessionStarting"), v115);
  v189[36] = v114;
  v188[37] = CFSTR("com.apple.link.systemProtocol.SetValue");
  v37 = [LNSystemProtocol alloc];
  objc_msgSend((id)objc_opt_class(), "parametersForProtocolWithIdentifier:", CFSTR("com.apple.link.systemProtocol.SetValue"));
  v113 = (void *)objc_claimAutoreleasedReturnValue();
  v112 = -[LNSystemProtocol initWithIdentifier:parameters:](v37, "initWithIdentifier:parameters:", CFSTR("com.apple.link.systemProtocol.SetValue"), v113);
  v189[37] = v112;
  v188[38] = CFSTR("com.apple.link.systemProtocol.StartDive");
  v38 = [LNSystemProtocol alloc];
  objc_msgSend((id)objc_opt_class(), "parametersForProtocolWithIdentifier:", CFSTR("com.apple.link.systemProtocol.StartDive"));
  v111 = (void *)objc_claimAutoreleasedReturnValue();
  v110 = -[LNSystemProtocol initWithIdentifier:parameters:](v38, "initWithIdentifier:parameters:", CFSTR("com.apple.link.systemProtocol.StartDive"), v111);
  v189[38] = v110;
  v188[39] = CFSTR("com.apple.link.systemProtocol.StartWorkout");
  v39 = [LNSystemProtocol alloc];
  objc_msgSend((id)objc_opt_class(), "parametersForProtocolWithIdentifier:", CFSTR("com.apple.link.systemProtocol.StartWorkout"));
  v109 = (void *)objc_claimAutoreleasedReturnValue();
  v108 = -[LNSystemProtocol initWithIdentifier:parameters:](v39, "initWithIdentifier:parameters:", CFSTR("com.apple.link.systemProtocol.StartWorkout"), v109);
  v189[39] = v108;
  v188[40] = CFSTR("com.apple.link.systemProtocol.Sting");
  v40 = [LNSystemProtocol alloc];
  objc_msgSend((id)objc_opt_class(), "parametersForProtocolWithIdentifier:", CFSTR("com.apple.link.systemProtocol.Sting"));
  v107 = (void *)objc_claimAutoreleasedReturnValue();
  v106 = -[LNSystemProtocol initWithIdentifier:parameters:](v40, "initWithIdentifier:parameters:", CFSTR("com.apple.link.systemProtocol.Sting"), v107);
  v189[40] = v106;
  v188[41] = CFSTR("com.apple.link.systemProtocol.SystemFramework");
  v41 = [LNSystemProtocol alloc];
  objc_msgSend((id)objc_opt_class(), "parametersForProtocolWithIdentifier:", CFSTR("com.apple.link.systemProtocol.SystemFramework"));
  v105 = (void *)objc_claimAutoreleasedReturnValue();
  v104 = -[LNSystemProtocol initWithIdentifier:parameters:](v41, "initWithIdentifier:parameters:", CFSTR("com.apple.link.systemProtocol.SystemFramework"), v105);
  v189[41] = v104;
  v188[42] = CFSTR("com.apple.link.systemProtocol.Toggle");
  v42 = [LNSystemProtocol alloc];
  objc_msgSend((id)objc_opt_class(), "parametersForProtocolWithIdentifier:", CFSTR("com.apple.link.systemProtocol.Toggle"));
  v103 = (void *)objc_claimAutoreleasedReturnValue();
  v102 = -[LNSystemProtocol initWithIdentifier:parameters:](v42, "initWithIdentifier:parameters:", CFSTR("com.apple.link.systemProtocol.Toggle"), v103);
  v189[42] = v102;
  v188[43] = CFSTR("com.apple.link.systemProtocol.Undo");
  v43 = [LNSystemProtocol alloc];
  objc_msgSend((id)objc_opt_class(), "parametersForProtocolWithIdentifier:", CFSTR("com.apple.link.systemProtocol.Undo"));
  v101 = (void *)objc_claimAutoreleasedReturnValue();
  v100 = -[LNSystemProtocol initWithIdentifier:parameters:](v43, "initWithIdentifier:parameters:", CFSTR("com.apple.link.systemProtocol.Undo"), v101);
  v189[43] = v100;
  v188[44] = CFSTR("com.apple.link.systemProtocol.Undoable");
  v44 = [LNSystemProtocol alloc];
  objc_msgSend((id)objc_opt_class(), "parametersForProtocolWithIdentifier:", CFSTR("com.apple.link.systemProtocol.Undoable"));
  v99 = (void *)objc_claimAutoreleasedReturnValue();
  v98 = -[LNSystemProtocol initWithIdentifier:parameters:](v44, "initWithIdentifier:parameters:", CFSTR("com.apple.link.systemProtocol.Undoable"), v99);
  v189[44] = v98;
  v188[45] = CFSTR("com.apple.link.systemProtocol.URLRepresentable");
  v45 = [LNSystemProtocol alloc];
  objc_msgSend((id)objc_opt_class(), "parametersForProtocolWithIdentifier:", CFSTR("com.apple.link.systemProtocol.URLRepresentable"));
  v97 = (void *)objc_claimAutoreleasedReturnValue();
  v96 = -[LNSystemProtocol initWithIdentifier:parameters:](v45, "initWithIdentifier:parameters:", CFSTR("com.apple.link.systemProtocol.URLRepresentable"), v97);
  v189[45] = v96;
  v188[46] = CFSTR("com.apple.link.systemProtocol.WidgetConfiguration");
  v46 = [LNSystemProtocol alloc];
  objc_msgSend((id)objc_opt_class(), "parametersForProtocolWithIdentifier:", CFSTR("com.apple.link.systemProtocol.WidgetConfiguration"));
  v95 = (void *)objc_claimAutoreleasedReturnValue();
  v94 = -[LNSystemProtocol initWithIdentifier:parameters:](v46, "initWithIdentifier:parameters:", CFSTR("com.apple.link.systemProtocol.WidgetConfiguration"), v95);
  v189[46] = v94;
  v188[47] = CFSTR("com.apple.link.systemProtocol.XPCListener");
  v47 = [LNSystemProtocol alloc];
  objc_msgSend((id)objc_opt_class(), "parametersForProtocolWithIdentifier:", CFSTR("com.apple.link.systemProtocol.XPCListener"));
  v93 = (void *)objc_claimAutoreleasedReturnValue();
  v92 = -[LNSystemProtocol initWithIdentifier:parameters:](v47, "initWithIdentifier:parameters:", CFSTR("com.apple.link.systemProtocol.XPCListener"), v93);
  v189[47] = v92;
  v188[48] = CFSTR("com.apple.link.systemProtocol.Zoom");
  v48 = [LNSystemProtocol alloc];
  objc_msgSend((id)objc_opt_class(), "parametersForProtocolWithIdentifier:", CFSTR("com.apple.link.systemProtocol.Zoom"));
  v91 = (void *)objc_claimAutoreleasedReturnValue();
  v90 = -[LNSystemProtocol initWithIdentifier:parameters:](v48, "initWithIdentifier:parameters:", CFSTR("com.apple.link.systemProtocol.Zoom"), v91);
  v189[48] = v90;
  v188[49] = CFSTR("com.apple.link.systemProtocol.AssistantIntent");
  v49 = [LNSystemProtocol alloc];
  objc_msgSend((id)objc_opt_class(), "parametersForProtocolWithIdentifier:", CFSTR("com.apple.link.systemProtocol.AssistantIntent"));
  v89 = (void *)objc_claimAutoreleasedReturnValue();
  v88 = -[LNSystemProtocol initWithIdentifier:parameters:](v49, "initWithIdentifier:parameters:", CFSTR("com.apple.link.systemProtocol.AssistantIntent"), v89);
  v189[49] = v88;
  v188[50] = CFSTR("com.apple.link.systemProtocol.AssistantInvocableIntent");
  v50 = [LNSystemProtocol alloc];
  objc_msgSend((id)objc_opt_class(), "parametersForProtocolWithIdentifier:", CFSTR("com.apple.link.systemProtocol.AssistantInvocableIntent"));
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  v86 = -[LNSystemProtocol initWithIdentifier:parameters:](v50, "initWithIdentifier:parameters:", CFSTR("com.apple.link.systemProtocol.AssistantInvocableIntent"), v87);
  v189[50] = v86;
  v188[51] = CFSTR("com.apple.link.systemProtocol.SendMail");
  v51 = [LNSystemProtocol alloc];
  objc_msgSend((id)objc_opt_class(), "parametersForProtocolWithIdentifier:", CFSTR("com.apple.link.systemProtocol.SendMail"));
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  v84 = -[LNSystemProtocol initWithIdentifier:parameters:](v51, "initWithIdentifier:parameters:", CFSTR("com.apple.link.systemProtocol.SendMail"), v85);
  v189[51] = v84;
  v188[52] = CFSTR("com.apple.link.systemProtocol.SetMailMessageIsRead");
  v52 = [LNSystemProtocol alloc];
  objc_msgSend((id)objc_opt_class(), "parametersForProtocolWithIdentifier:", CFSTR("com.apple.link.systemProtocol.SetMailMessageIsRead"));
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  v82 = -[LNSystemProtocol initWithIdentifier:parameters:](v52, "initWithIdentifier:parameters:", CFSTR("com.apple.link.systemProtocol.SetMailMessageIsRead"), v83);
  v189[52] = v82;
  v188[53] = CFSTR("com.apple.link.systemProtocol.SendMessage");
  v53 = [LNSystemProtocol alloc];
  objc_msgSend((id)objc_opt_class(), "parametersForProtocolWithIdentifier:", CFSTR("com.apple.link.systemProtocol.SendMessage"));
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  v80 = -[LNSystemProtocol initWithIdentifier:parameters:](v53, "initWithIdentifier:parameters:", CFSTR("com.apple.link.systemProtocol.SendMessage"), v81);
  v189[53] = v80;
  v188[54] = CFSTR("com.apple.link.systemProtocol.PlayVideo");
  v54 = [LNSystemProtocol alloc];
  objc_msgSend((id)objc_opt_class(), "parametersForProtocolWithIdentifier:", CFSTR("com.apple.link.systemProtocol.PlayVideo"));
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  v78 = -[LNSystemProtocol initWithIdentifier:parameters:](v54, "initWithIdentifier:parameters:", CFSTR("com.apple.link.systemProtocol.PlayVideo"), v79);
  v189[54] = v78;
  v188[55] = CFSTR("com.apple.link.systemProtocol.ShowSearchResultsInApp");
  v55 = [LNSystemProtocol alloc];
  objc_msgSend((id)objc_opt_class(), "parametersForProtocolWithIdentifier:", CFSTR("com.apple.link.systemProtocol.ShowSearchResultsInApp"));
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  v76 = -[LNSystemProtocol initWithIdentifier:parameters:](v55, "initWithIdentifier:parameters:", CFSTR("com.apple.link.systemProtocol.ShowSearchResultsInApp"), v77);
  v189[55] = v76;
  v188[56] = CFSTR("com.apple.link.systemProtocol.ShowInAppSearchResults");
  v56 = [LNSystemProtocol alloc];
  objc_msgSend((id)objc_opt_class(), "parametersForProtocolWithIdentifier:", CFSTR("com.apple.link.systemProtocol.ShowInAppSearchResults"));
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  v74 = -[LNSystemProtocol initWithIdentifier:parameters:](v56, "initWithIdentifier:parameters:", CFSTR("com.apple.link.systemProtocol.ShowInAppSearchResults"), v75);
  v189[56] = v74;
  v188[57] = CFSTR("com.apple.link.systemProtocol.ShowInAppStringSearchResults");
  v57 = [LNSystemProtocol alloc];
  objc_msgSend((id)objc_opt_class(), "parametersForProtocolWithIdentifier:", CFSTR("com.apple.link.systemProtocol.ShowInAppStringSearchResults"));
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  v58 = -[LNSystemProtocol initWithIdentifier:parameters:](v57, "initWithIdentifier:parameters:", CFSTR("com.apple.link.systemProtocol.ShowInAppStringSearchResults"), v73);
  v189[57] = v58;
  v188[58] = CFSTR("com.apple.link.systemProtocol.CameraCapture");
  v59 = [LNSystemProtocol alloc];
  objc_msgSend((id)objc_opt_class(), "parametersForProtocolWithIdentifier:", CFSTR("com.apple.link.systemProtocol.CameraCapture"));
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  v61 = -[LNSystemProtocol initWithIdentifier:parameters:](v59, "initWithIdentifier:parameters:", CFSTR("com.apple.link.systemProtocol.CameraCapture"), v60);
  v189[58] = v61;
  v188[59] = CFSTR("com.apple.link.systemProtocol.StaccatoLongPress");
  v62 = [LNSystemProtocol alloc];
  objc_msgSend((id)objc_opt_class(), "parametersForProtocolWithIdentifier:", CFSTR("com.apple.link.systemProtocol.StaccatoLongPress"));
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  v64 = -[LNSystemProtocol initWithIdentifier:parameters:](v62, "initWithIdentifier:parameters:", CFSTR("com.apple.link.systemProtocol.StaccatoLongPress"), v63);
  v189[59] = v64;
  v188[60] = CFSTR("com.apple.link.systemProtocol.WritingToolsProofread");
  v65 = [LNSystemProtocol alloc];
  objc_msgSend((id)objc_opt_class(), "parametersForProtocolWithIdentifier:", CFSTR("com.apple.link.systemProtocol.WritingToolsProofread"));
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  v67 = -[LNSystemProtocol initWithIdentifier:parameters:](v65, "initWithIdentifier:parameters:", CFSTR("com.apple.link.systemProtocol.WritingToolsProofread"), v66);
  v189[60] = v67;
  v188[61] = CFSTR("com.apple.link.systemProtocol.WritingToolsRewrite");
  v68 = [LNSystemProtocol alloc];
  objc_msgSend((id)objc_opt_class(), "parametersForProtocolWithIdentifier:", CFSTR("com.apple.link.systemProtocol.WritingToolsRewrite"));
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  v70 = -[LNSystemProtocol initWithIdentifier:parameters:](v68, "initWithIdentifier:parameters:", CFSTR("com.apple.link.systemProtocol.WritingToolsRewrite"), v69);
  v189[61] = v70;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v189, v188, 62);
  v71 = objc_claimAutoreleasedReturnValue();
  v72 = (void *)allProtocolsByIdentifier_protocolsByIdentifier_6765;
  allProtocolsByIdentifier_protocolsByIdentifier_6765 = v71;

}

- (LNSystemProtocol)initWithIdentifier:(id)a3 parameters:(id)a4
{
  id v7;
  id v8;
  void *v9;
  LNSystemProtocol *v10;
  uint64_t v11;
  NSString *identifier;
  uint64_t v13;
  NSDictionary *parameters;
  LNSystemProtocol *v15;
  void *v17;
  void *v18;
  objc_super v19;

  v7 = a3;
  v8 = a4;
  v9 = v8;
  if (v7)
  {
    if (v8)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("LNSystemProtocol.m"), 376, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("identifier"));

    if (v9)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("LNSystemProtocol.m"), 377, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("parameters"));

LABEL_3:
  v19.receiver = self;
  v19.super_class = (Class)LNSystemProtocol;
  v10 = -[LNSystemProtocol init](&v19, sel_init);
  if (v10)
  {
    v11 = objc_msgSend(v7, "copy");
    identifier = v10->_identifier;
    v10->_identifier = (NSString *)v11;

    v13 = objc_msgSend(v9, "copy");
    parameters = v10->_parameters;
    v10->_parameters = (NSDictionary *)v13;

    v15 = v10;
  }

  return v10;
}

+ (id)parametersForProtocolWithIdentifier:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  const __CFString *v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(a3, "isEqualToString:", CFSTR("com.apple.link.systemProtocol.ChangeBinarySetting")))
  {
    v7 = CFSTR("setting");
    if (parametersForProtocolWithIdentifier__onceToken[0] != -1)
      dispatch_once(parametersForProtocolWithIdentifier__onceToken, &__block_literal_global_198);
    v8[0] = parametersForProtocolWithIdentifier__value;
    v3 = (void *)MEMORY[0x1E0C99D80];
    v4 = (id)parametersForProtocolWithIdentifier__value;
    objc_msgSend(v3, "dictionaryWithObjects:forKeys:count:", v8, &v7, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = (void *)MEMORY[0x1E0C9AA70];
  }
  return v5;
}

void __56__LNSystemProtocol_parametersForProtocolWithIdentifier___block_invoke()
{
  LNSystemProtocolParameter *v0;
  void *v1;

  v0 = -[LNSystemProtocolParameter initWithVocabularyModel:]([LNSystemProtocolParameter alloc], "initWithVocabularyModel:", 2);
  v1 = (void *)parametersForProtocolWithIdentifier__value;
  parametersForProtocolWithIdentifier__value = (uint64_t)v0;

}

- (NSString)identifier
{
  return self->_identifier;
}

+ (LNSystemProtocol)sessionStartingProtocol
{
  if (sessionStartingProtocol_onceToken != -1)
    dispatch_once(&sessionStartingProtocol_onceToken, &__block_literal_global_157);
  return (LNSystemProtocol *)(id)sessionStartingProtocol_value;
}

+ (LNSystemProtocol)pushToTalkTransmissionProtocol
{
  if (pushToTalkTransmissionProtocol_onceToken != -1)
    dispatch_once(&pushToTalkTransmissionProtocol_onceToken, &__block_literal_global_170);
  return (LNSystemProtocol *)(id)pushToTalkTransmissionProtocol_value;
}

+ (LNSystemProtocol)foregroundContinuableProtocol
{
  if (foregroundContinuableProtocol_onceToken != -1)
    dispatch_once(&foregroundContinuableProtocol_onceToken, &__block_literal_global_141);
  return (LNSystemProtocol *)(id)foregroundContinuableProtocol_value;
}

+ (LNSystemProtocol)focusConfigurationProtocol
{
  if (focusConfigurationProtocol_onceToken != -1)
    dispatch_once(&focusConfigurationProtocol_onceToken, &__block_literal_global_140);
  return (LNSystemProtocol *)(id)focusConfigurationProtocol_value;
}

- (NSString)typeName
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  -[LNSystemProtocol identifier](self, "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "componentsSeparatedByString:", CFSTR("."));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "lastObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@Action"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v5;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[LNSystemProtocol typeName](self, "typeName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p, typeName: %@>"), v5, self, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (LNSystemProtocol)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  LNSystemProtocol *v11;

  v4 = a3;
  v5 = (void *)MEMORY[0x1E0C99E60];
  v6 = objc_opt_class();
  v7 = objc_opt_class();
  objc_msgSend(v5, "setWithObjects:", v6, v7, objc_opt_class(), 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("parameters"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("identifier"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      self = -[LNSystemProtocol initWithIdentifier:parameters:](self, "initWithIdentifier:parameters:", v10, v9);
      v11 = self;
    }
    else
    {
      v11 = 0;
    }

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[LNSystemProtocol identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("identifier"));

  -[LNSystemProtocol parameters](self, "parameters");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("parameters"));

}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  unint64_t v6;

  -[LNSystemProtocol identifier](self, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[LNSystemProtocol parameters](self, "parameters");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  LNSystemProtocol *v4;
  LNSystemProtocol *v5;
  LNSystemProtocol *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  char v14;

  v4 = (LNSystemProtocol *)a3;
  v5 = v4;
  if (self == v4)
  {
    v14 = 1;
  }
  else
  {
    v6 = v4;
    if (v6 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      -[LNSystemProtocol identifier](self, "identifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[LNSystemProtocol identifier](v6, "identifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v7, "isEqualToString:", v8))
      {
        -[LNSystemProtocol parameters](self, "parameters");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[LNSystemProtocol parameters](v6, "parameters");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = v9;
        v12 = v10;
        v13 = v12;
        if (v11 == v12)
        {
          v14 = 1;
        }
        else
        {
          v14 = 0;
          if (v11 && v12)
            v14 = objc_msgSend(v11, "isEqualToDictionary:", v12);
        }

      }
      else
      {
        v14 = 0;
      }

    }
    else
    {
      v14 = 0;
    }

  }
  return v14;
}

- (NSDictionary)parameters
{
  return self->_parameters;
}

- (NSString)defaultActionIdentifier
{
  return self->_defaultActionIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_defaultActionIdentifier, 0);
  objc_storeStrong((id *)&self->_parameters, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

+ (LNSystemProtocol)cancelProtocol
{
  if (cancelProtocol_onceToken != -1)
    dispatch_once(&cancelProtocol_onceToken, &__block_literal_global_125);
  return (LNSystemProtocol *)(id)cancelProtocol_value;
}

+ (LNSystemProtocol)changeBinarySettingSystemProtocol
{
  if (changeBinarySettingSystemProtocol_onceToken != -1)
    dispatch_once(&changeBinarySettingSystemProtocol_onceToken, &__block_literal_global_126);
  return (LNSystemProtocol *)(id)changeBinarySettingSystemProtocol_value;
}

+ (LNSystemProtocol)closeEntityProtocol
{
  if (closeEntityProtocol_onceToken != -1)
    dispatch_once(&closeEntityProtocol_onceToken, &__block_literal_global_127);
  return (LNSystemProtocol *)(id)closeEntityProtocol_value;
}

+ (LNSystemProtocol)conditionallyEnabledProtocol
{
  if (conditionallyEnabledProtocol_onceToken != -1)
    dispatch_once(&conditionallyEnabledProtocol_onceToken, &__block_literal_global_128);
  return (LNSystemProtocol *)(id)conditionallyEnabledProtocol_value;
}

+ (LNSystemProtocol)copyEntityProtocol
{
  if (copyEntityProtocol_onceToken != -1)
    dispatch_once(&copyEntityProtocol_onceToken, &__block_literal_global_129);
  return (LNSystemProtocol *)(id)copyEntityProtocol_value;
}

+ (LNSystemProtocol)copySystemProtocol
{
  if (copySystemProtocol_onceToken != -1)
    dispatch_once(&copySystemProtocol_onceToken, &__block_literal_global_130);
  return (LNSystemProtocol *)(id)copySystemProtocol_value;
}

+ (LNSystemProtocol)createEntitySystemProtocol
{
  if (createEntitySystemProtocol_onceToken != -1)
    dispatch_once(&createEntitySystemProtocol_onceToken, &__block_literal_global_131);
  return (LNSystemProtocol *)(id)createEntitySystemProtocol_value;
}

+ (LNSystemProtocol)cutEntityProtocol
{
  if (cutEntityProtocol_onceToken != -1)
    dispatch_once(&cutEntityProtocol_onceToken, &__block_literal_global_132);
  return (LNSystemProtocol *)(id)cutEntityProtocol_value;
}

+ (LNSystemProtocol)cutSystemProtocol
{
  if (cutSystemProtocol_onceToken != -1)
    dispatch_once(&cutSystemProtocol_onceToken, &__block_literal_global_133);
  return (LNSystemProtocol *)(id)cutSystemProtocol_value;
}

+ (LNSystemProtocol)deleteEntitySystemProtocol
{
  if (deleteEntitySystemProtocol_onceToken != -1)
    dispatch_once(&deleteEntitySystemProtocol_onceToken, &__block_literal_global_134);
  return (LNSystemProtocol *)(id)deleteEntitySystemProtocol_value;
}

+ (LNSystemProtocol)duplicateEntitySystemProtocol
{
  if (duplicateEntitySystemProtocol_onceToken != -1)
    dispatch_once(&duplicateEntitySystemProtocol_onceToken, &__block_literal_global_135);
  return (LNSystemProtocol *)(id)duplicateEntitySystemProtocol_value;
}

+ (LNSystemProtocol)enterMarkupProtocol
{
  if (enterMarkupProtocol_onceToken != -1)
    dispatch_once(&enterMarkupProtocol_onceToken, &__block_literal_global_136);
  return (LNSystemProtocol *)(id)enterMarkupProtocol_value;
}

+ (LNSystemProtocol)entityUpdatingProtocol
{
  if (entityUpdatingProtocol_onceToken != -1)
    dispatch_once(&entityUpdatingProtocol_onceToken, &__block_literal_global_137);
  return (LNSystemProtocol *)(id)entityUpdatingProtocol_value;
}

+ (LNSystemProtocol)exitMarkupProtocol
{
  if (exitMarkupProtocol_onceToken != -1)
    dispatch_once(&exitMarkupProtocol_onceToken, &__block_literal_global_138);
  return (LNSystemProtocol *)(id)exitMarkupProtocol_value;
}

+ (LNSystemProtocol)favoriteEntityProtocol
{
  if (favoriteEntityProtocol_onceToken != -1)
    dispatch_once(&favoriteEntityProtocol_onceToken, &__block_literal_global_139);
  return (LNSystemProtocol *)(id)favoriteEntityProtocol_value;
}

+ (LNSystemProtocol)moveSpatialProtocol
{
  if (moveSpatialProtocol_onceToken != -1)
    dispatch_once(&moveSpatialProtocol_onceToken, &__block_literal_global_142);
  return (LNSystemProtocol *)(id)moveSpatialProtocol_value;
}

+ (LNSystemProtocol)navigateSequentiallyProtocol
{
  if (navigateSequentiallyProtocol_onceToken != -1)
    dispatch_once(&navigateSequentiallyProtocol_onceToken, &__block_literal_global_143);
  return (LNSystemProtocol *)(id)navigateSequentiallyProtocol_value;
}

+ (LNSystemProtocol)openEntitySystemProtocol
{
  if (openEntitySystemProtocol_onceToken != -1)
    dispatch_once(&openEntitySystemProtocol_onceToken, &__block_literal_global_144);
  return (LNSystemProtocol *)(id)openEntitySystemProtocol_value;
}

+ (LNSystemProtocol)pasteSystemProtocol
{
  if (pasteSystemProtocol_onceToken != -1)
    dispatch_once(&pasteSystemProtocol_onceToken, &__block_literal_global_145);
  return (LNSystemProtocol *)(id)pasteSystemProtocol_value;
}

+ (LNSystemProtocol)pauseWorkoutProtocol
{
  if (pauseWorkoutProtocol_onceToken != -1)
    dispatch_once(&pauseWorkoutProtocol_onceToken, &__block_literal_global_146);
  return (LNSystemProtocol *)(id)pauseWorkoutProtocol_value;
}

+ (LNSystemProtocol)previewEntityProtocol
{
  if (previewEntityProtocol_onceToken != -1)
    dispatch_once(&previewEntityProtocol_onceToken, &__block_literal_global_147);
  return (LNSystemProtocol *)(id)previewEntityProtocol_value;
}

+ (LNSystemProtocol)progressReportingProtocol
{
  if (progressReportingProtocol_onceToken != -1)
    dispatch_once(&progressReportingProtocol_onceToken, &__block_literal_global_148);
  return (LNSystemProtocol *)(id)progressReportingProtocol_value;
}

+ (LNSystemProtocol)propertyUpdaterProtocol
{
  if (propertyUpdaterProtocol_onceToken != -1)
    dispatch_once(&propertyUpdaterProtocol_onceToken, &__block_literal_global_149);
  return (LNSystemProtocol *)(id)propertyUpdaterProtocol_value;
}

+ (LNSystemProtocol)putEntityInContainerProtocol
{
  if (putEntityInContainerProtocol_onceToken != -1)
    dispatch_once(&putEntityInContainerProtocol_onceToken, &__block_literal_global_150);
  return (LNSystemProtocol *)(id)putEntityInContainerProtocol_value;
}

+ (LNSystemProtocol)requiresMDMChecksProtocol
{
  if (requiresMDMChecksProtocol_onceToken != -1)
    dispatch_once(&requiresMDMChecksProtocol_onceToken, &__block_literal_global_151);
  return (LNSystemProtocol *)(id)requiresMDMChecksProtocol_value;
}

+ (LNSystemProtocol)resizeProtocol
{
  if (resizeProtocol_onceToken != -1)
    dispatch_once(&resizeProtocol_onceToken, &__block_literal_global_152);
  return (LNSystemProtocol *)(id)resizeProtocol_value;
}

+ (LNSystemProtocol)resumeWorkoutProtocol
{
  if (resumeWorkoutProtocol_onceToken != -1)
    dispatch_once(&resumeWorkoutProtocol_onceToken, &__block_literal_global_153);
  return (LNSystemProtocol *)(id)resumeWorkoutProtocol_value;
}

+ (LNSystemProtocol)saveEntitySystemProtocol
{
  if (saveEntitySystemProtocol_onceToken != -1)
    dispatch_once(&saveEntitySystemProtocol_onceToken, &__block_literal_global_154);
  return (LNSystemProtocol *)(id)saveEntitySystemProtocol_value;
}

+ (LNSystemProtocol)scrollProtocol
{
  if (scrollProtocol_onceToken != -1)
    dispatch_once(&scrollProtocol_onceToken, &__block_literal_global_155);
  return (LNSystemProtocol *)(id)scrollProtocol_value;
}

+ (LNSystemProtocol)searchSystemProtocol
{
  if (searchSystemProtocol_onceToken != -1)
    dispatch_once(&searchSystemProtocol_onceToken, &__block_literal_global_156);
  return (LNSystemProtocol *)(id)searchSystemProtocol_value;
}

+ (LNSystemProtocol)setValueProtocol
{
  if (setValueProtocol_onceToken != -1)
    dispatch_once(&setValueProtocol_onceToken, &__block_literal_global_158);
  return (LNSystemProtocol *)(id)setValueProtocol_value;
}

+ (LNSystemProtocol)startDiveProtocol
{
  if (startDiveProtocol_onceToken != -1)
    dispatch_once(&startDiveProtocol_onceToken, &__block_literal_global_159);
  return (LNSystemProtocol *)(id)startDiveProtocol_value;
}

+ (LNSystemProtocol)startWorkoutProtocol
{
  if (startWorkoutProtocol_onceToken != -1)
    dispatch_once(&startWorkoutProtocol_onceToken, &__block_literal_global_160);
  return (LNSystemProtocol *)(id)startWorkoutProtocol_value;
}

+ (LNSystemProtocol)stingProtocol
{
  if (stingProtocol_onceToken != -1)
    dispatch_once(&stingProtocol_onceToken, &__block_literal_global_161);
  return (LNSystemProtocol *)(id)stingProtocol_value;
}

+ (LNSystemProtocol)systemFrameworkProtocol
{
  if (systemFrameworkProtocol_onceToken != -1)
    dispatch_once(&systemFrameworkProtocol_onceToken, &__block_literal_global_162);
  return (LNSystemProtocol *)(id)systemFrameworkProtocol_value;
}

+ (LNSystemProtocol)toggleProtocol
{
  if (toggleProtocol_onceToken != -1)
    dispatch_once(&toggleProtocol_onceToken, &__block_literal_global_163);
  return (LNSystemProtocol *)(id)toggleProtocol_value;
}

+ (LNSystemProtocol)undoableProtocol
{
  if (undoableProtocol_onceToken != -1)
    dispatch_once(&undoableProtocol_onceToken, &__block_literal_global_164);
  return (LNSystemProtocol *)(id)undoableProtocol_value;
}

+ (LNSystemProtocol)undoSystemProtocol
{
  if (undoSystemProtocol_onceToken != -1)
    dispatch_once(&undoSystemProtocol_onceToken, &__block_literal_global_165);
  return (LNSystemProtocol *)(id)undoSystemProtocol_value;
}

+ (LNSystemProtocol)widgetConfigurationProtocol
{
  if (widgetConfigurationProtocol_onceToken != -1)
    dispatch_once(&widgetConfigurationProtocol_onceToken, &__block_literal_global_166);
  return (LNSystemProtocol *)(id)widgetConfigurationProtocol_value;
}

+ (LNSystemProtocol)controlConfigurationProtocol
{
  if (controlConfigurationProtocol_onceToken != -1)
    dispatch_once(&controlConfigurationProtocol_onceToken, &__block_literal_global_167);
  return (LNSystemProtocol *)(id)controlConfigurationProtocol_value;
}

+ (LNSystemProtocol)xpcListenerProtocol
{
  if (xpcListenerProtocol_onceToken != -1)
    dispatch_once(&xpcListenerProtocol_onceToken, &__block_literal_global_168);
  return (LNSystemProtocol *)(id)xpcListenerProtocol_value;
}

+ (LNSystemProtocol)zoomProtocol
{
  if (zoomProtocol_onceToken != -1)
    dispatch_once(&zoomProtocol_onceToken, &__block_literal_global_169);
  return (LNSystemProtocol *)(id)zoomProtocol_value;
}

+ (LNSystemProtocol)urlRepresentableProtocol
{
  if (urlRepresentableProtocol_onceToken_6768 != -1)
    dispatch_once(&urlRepresentableProtocol_onceToken_6768, &__block_literal_global_171);
  return (LNSystemProtocol *)(id)urlRepresentableProtocol_value_6769;
}

+ (LNSystemProtocol)assistantIntentProtocol
{
  if (assistantIntentProtocol_onceToken != -1)
    dispatch_once(&assistantIntentProtocol_onceToken, &__block_literal_global_172);
  return (LNSystemProtocol *)(id)assistantIntentProtocol_value;
}

+ (LNSystemProtocol)assistantInvocableIntentProtocol
{
  if (assistantInvocableIntentProtocol_onceToken != -1)
    dispatch_once(&assistantInvocableIntentProtocol_onceToken, &__block_literal_global_173);
  return (LNSystemProtocol *)(id)assistantInvocableIntentProtocol_value;
}

+ (LNSystemProtocol)sendMailProtocol
{
  if (sendMailProtocol_onceToken != -1)
    dispatch_once(&sendMailProtocol_onceToken, &__block_literal_global_174);
  return (LNSystemProtocol *)(id)sendMailProtocol_value;
}

+ (LNSystemProtocol)setMailMessageIsReadProtocol
{
  if (setMailMessageIsReadProtocol_onceToken != -1)
    dispatch_once(&setMailMessageIsReadProtocol_onceToken, &__block_literal_global_175);
  return (LNSystemProtocol *)(id)setMailMessageIsReadProtocol_value;
}

+ (id)sendMessageProtocol
{
  if (sendMessageProtocol_onceToken != -1)
    dispatch_once(&sendMessageProtocol_onceToken, &__block_literal_global_176);
  return (id)sendMessageProtocol_value;
}

+ (LNSystemProtocol)playVideoProtocol
{
  if (playVideoProtocol_onceToken != -1)
    dispatch_once(&playVideoProtocol_onceToken, &__block_literal_global_177);
  return (LNSystemProtocol *)(id)playVideoProtocol_value;
}

+ (LNSystemProtocol)showSearchResultsInAppProtocol
{
  if (showSearchResultsInAppProtocol_onceToken != -1)
    dispatch_once(&showSearchResultsInAppProtocol_onceToken, &__block_literal_global_178);
  return (LNSystemProtocol *)(id)showSearchResultsInAppProtocol_value;
}

+ (LNSystemProtocol)showStringSearchResultsInAppProtocol
{
  if (showStringSearchResultsInAppProtocol_onceToken != -1)
    dispatch_once(&showStringSearchResultsInAppProtocol_onceToken, &__block_literal_global_179);
  return (LNSystemProtocol *)(id)showStringSearchResultsInAppProtocol_value;
}

+ (LNSystemProtocol)showInAppSearchResultsProtocol
{
  if (showInAppSearchResultsProtocol_onceToken != -1)
    dispatch_once(&showInAppSearchResultsProtocol_onceToken, &__block_literal_global_180);
  return (LNSystemProtocol *)(id)showInAppSearchResultsProtocol_value;
}

+ (LNSystemProtocol)showInAppStringSearchResultsProtocol
{
  if (showInAppStringSearchResultsProtocol_onceToken != -1)
    dispatch_once(&showInAppStringSearchResultsProtocol_onceToken, &__block_literal_global_181);
  return (LNSystemProtocol *)(id)showInAppStringSearchResultsProtocol_value;
}

+ (LNSystemProtocol)cameraCaptureProtocol
{
  if (cameraCaptureProtocol_onceToken != -1)
    dispatch_once(&cameraCaptureProtocol_onceToken, &__block_literal_global_182);
  return (LNSystemProtocol *)(id)cameraCaptureProtocol_value;
}

+ (LNSystemProtocol)staccatoLongPressProtocol
{
  if (staccatoLongPressProtocol_onceToken != -1)
    dispatch_once(&staccatoLongPressProtocol_onceToken, &__block_literal_global_183);
  return (LNSystemProtocol *)(id)staccatoLongPressProtocol_value;
}

+ (LNSystemProtocol)writingToolsProofreadProtocol
{
  if (writingToolsProofreadProtocol_onceToken != -1)
    dispatch_once(&writingToolsProofreadProtocol_onceToken, &__block_literal_global_184);
  return (LNSystemProtocol *)(id)writingToolsProofreadProtocol_value;
}

+ (LNSystemProtocol)writingToolsRewriteProtocol
{
  if (writingToolsRewriteProtocol_onceToken != -1)
    dispatch_once(&writingToolsRewriteProtocol_onceToken, &__block_literal_global_185);
  return (LNSystemProtocol *)(id)writingToolsRewriteProtocol_value;
}

+ (NSArray)allProtocols
{
  void *v2;
  void *v3;

  objc_msgSend(a1, "allProtocolsByIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allValues");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

void __47__LNSystemProtocol_writingToolsRewriteProtocol__block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;

  +[LNSystemProtocol allProtocolsByIdentifier](LNSystemProtocol, "allProtocolsByIdentifier");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "valueForKey:", CFSTR("com.apple.link.systemProtocol.WritingToolsRewrite"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)writingToolsRewriteProtocol_value;
  writingToolsRewriteProtocol_value = v0;

}

void __49__LNSystemProtocol_writingToolsProofreadProtocol__block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;

  +[LNSystemProtocol allProtocolsByIdentifier](LNSystemProtocol, "allProtocolsByIdentifier");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "valueForKey:", CFSTR("com.apple.link.systemProtocol.WritingToolsProofread"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)writingToolsProofreadProtocol_value;
  writingToolsProofreadProtocol_value = v0;

}

void __45__LNSystemProtocol_staccatoLongPressProtocol__block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;

  +[LNSystemProtocol allProtocolsByIdentifier](LNSystemProtocol, "allProtocolsByIdentifier");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "valueForKey:", CFSTR("com.apple.link.systemProtocol.CameraCapture"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)staccatoLongPressProtocol_value;
  staccatoLongPressProtocol_value = v0;

}

void __41__LNSystemProtocol_cameraCaptureProtocol__block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;

  +[LNSystemProtocol allProtocolsByIdentifier](LNSystemProtocol, "allProtocolsByIdentifier");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "valueForKey:", CFSTR("com.apple.link.systemProtocol.CameraCapture"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)cameraCaptureProtocol_value;
  cameraCaptureProtocol_value = v0;

}

void __56__LNSystemProtocol_showInAppStringSearchResultsProtocol__block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;

  +[LNSystemProtocol allProtocolsByIdentifier](LNSystemProtocol, "allProtocolsByIdentifier");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "valueForKey:", CFSTR("com.apple.link.systemProtocol.ShowInAppStringSearchResults"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)showInAppStringSearchResultsProtocol_value;
  showInAppStringSearchResultsProtocol_value = v0;

}

void __50__LNSystemProtocol_showInAppSearchResultsProtocol__block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;

  +[LNSystemProtocol allProtocolsByIdentifier](LNSystemProtocol, "allProtocolsByIdentifier");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "valueForKey:", CFSTR("com.apple.link.systemProtocol.ShowInAppSearchResults"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)showInAppSearchResultsProtocol_value;
  showInAppSearchResultsProtocol_value = v0;

}

void __56__LNSystemProtocol_showStringSearchResultsInAppProtocol__block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;

  +[LNSystemProtocol allProtocolsByIdentifier](LNSystemProtocol, "allProtocolsByIdentifier");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "valueForKey:", CFSTR("com.apple.link.systemProtocol.ShowSearchResultsInApp"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)showStringSearchResultsInAppProtocol_value;
  showStringSearchResultsInAppProtocol_value = v0;

}

void __50__LNSystemProtocol_showSearchResultsInAppProtocol__block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;

  +[LNSystemProtocol allProtocolsByIdentifier](LNSystemProtocol, "allProtocolsByIdentifier");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "valueForKey:", CFSTR("com.apple.link.systemProtocol.ShowSearchResultsInApp"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)showSearchResultsInAppProtocol_value;
  showSearchResultsInAppProtocol_value = v0;

}

void __37__LNSystemProtocol_playVideoProtocol__block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;

  +[LNSystemProtocol allProtocolsByIdentifier](LNSystemProtocol, "allProtocolsByIdentifier");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "valueForKey:", CFSTR("com.apple.link.systemProtocol.PlayVideo"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)playVideoProtocol_value;
  playVideoProtocol_value = v0;

}

void __39__LNSystemProtocol_sendMessageProtocol__block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;

  +[LNSystemProtocol allProtocolsByIdentifier](LNSystemProtocol, "allProtocolsByIdentifier");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "valueForKey:", CFSTR("com.apple.link.systemProtocol.SendMessage"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)sendMessageProtocol_value;
  sendMessageProtocol_value = v0;

}

void __48__LNSystemProtocol_setMailMessageIsReadProtocol__block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;

  +[LNSystemProtocol allProtocolsByIdentifier](LNSystemProtocol, "allProtocolsByIdentifier");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "valueForKey:", CFSTR("com.apple.link.systemProtocol.SetMailMessageIsRead"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)setMailMessageIsReadProtocol_value;
  setMailMessageIsReadProtocol_value = v0;

}

void __36__LNSystemProtocol_sendMailProtocol__block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;

  +[LNSystemProtocol allProtocolsByIdentifier](LNSystemProtocol, "allProtocolsByIdentifier");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "valueForKey:", CFSTR("com.apple.link.systemProtocol.SendMail"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)sendMailProtocol_value;
  sendMailProtocol_value = v0;

}

void __52__LNSystemProtocol_assistantInvocableIntentProtocol__block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;

  +[LNSystemProtocol allProtocolsByIdentifier](LNSystemProtocol, "allProtocolsByIdentifier");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "valueForKey:", CFSTR("com.apple.link.systemProtocol.AssistantInvocableIntent"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)assistantInvocableIntentProtocol_value;
  assistantInvocableIntentProtocol_value = v0;

}

void __43__LNSystemProtocol_assistantIntentProtocol__block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;

  +[LNSystemProtocol allProtocolsByIdentifier](LNSystemProtocol, "allProtocolsByIdentifier");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "valueForKey:", CFSTR("com.apple.link.systemProtocol.AssistantIntent"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)assistantIntentProtocol_value;
  assistantIntentProtocol_value = v0;

}

void __44__LNSystemProtocol_urlRepresentableProtocol__block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;

  +[LNSystemProtocol allProtocolsByIdentifier](LNSystemProtocol, "allProtocolsByIdentifier");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "valueForKey:", CFSTR("com.apple.link.systemProtocol.URLRepresentable"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)urlRepresentableProtocol_value_6769;
  urlRepresentableProtocol_value_6769 = v0;

}

void __50__LNSystemProtocol_pushToTalkTransmissionProtocol__block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;

  +[LNSystemProtocol allProtocolsByIdentifier](LNSystemProtocol, "allProtocolsByIdentifier");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "valueForKey:", CFSTR("com.apple.link.systemProtocol.PushToTalkTransmission"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)pushToTalkTransmissionProtocol_value;
  pushToTalkTransmissionProtocol_value = v0;

}

void __32__LNSystemProtocol_zoomProtocol__block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;

  +[LNSystemProtocol allProtocolsByIdentifier](LNSystemProtocol, "allProtocolsByIdentifier");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "valueForKey:", CFSTR("com.apple.link.systemProtocol.Zoom"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)zoomProtocol_value;
  zoomProtocol_value = v0;

}

void __39__LNSystemProtocol_xpcListenerProtocol__block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;

  +[LNSystemProtocol allProtocolsByIdentifier](LNSystemProtocol, "allProtocolsByIdentifier");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "valueForKey:", CFSTR("com.apple.link.systemProtocol.XPCListener"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)xpcListenerProtocol_value;
  xpcListenerProtocol_value = v0;

}

void __48__LNSystemProtocol_controlConfigurationProtocol__block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;

  +[LNSystemProtocol allProtocolsByIdentifier](LNSystemProtocol, "allProtocolsByIdentifier");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "valueForKey:", CFSTR("com.apple.link.systemProtocol.ControlConfiguration"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)controlConfigurationProtocol_value;
  controlConfigurationProtocol_value = v0;

}

void __47__LNSystemProtocol_widgetConfigurationProtocol__block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;

  +[LNSystemProtocol allProtocolsByIdentifier](LNSystemProtocol, "allProtocolsByIdentifier");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "valueForKey:", CFSTR("com.apple.link.systemProtocol.WidgetConfiguration"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)widgetConfigurationProtocol_value;
  widgetConfigurationProtocol_value = v0;

}

void __38__LNSystemProtocol_undoSystemProtocol__block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;

  +[LNSystemProtocol allProtocolsByIdentifier](LNSystemProtocol, "allProtocolsByIdentifier");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "valueForKey:", CFSTR("com.apple.link.systemProtocol.Undo"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)undoSystemProtocol_value;
  undoSystemProtocol_value = v0;

}

void __36__LNSystemProtocol_undoableProtocol__block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;

  +[LNSystemProtocol allProtocolsByIdentifier](LNSystemProtocol, "allProtocolsByIdentifier");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "valueForKey:", CFSTR("com.apple.link.systemProtocol.Undoable"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)undoableProtocol_value;
  undoableProtocol_value = v0;

}

void __34__LNSystemProtocol_toggleProtocol__block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;

  +[LNSystemProtocol allProtocolsByIdentifier](LNSystemProtocol, "allProtocolsByIdentifier");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "valueForKey:", CFSTR("com.apple.link.systemProtocol.Toggle"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)toggleProtocol_value;
  toggleProtocol_value = v0;

}

void __43__LNSystemProtocol_systemFrameworkProtocol__block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;

  +[LNSystemProtocol allProtocolsByIdentifier](LNSystemProtocol, "allProtocolsByIdentifier");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "valueForKey:", CFSTR("com.apple.link.systemProtocol.SystemFramework"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)systemFrameworkProtocol_value;
  systemFrameworkProtocol_value = v0;

}

void __33__LNSystemProtocol_stingProtocol__block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;

  +[LNSystemProtocol allProtocolsByIdentifier](LNSystemProtocol, "allProtocolsByIdentifier");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "valueForKey:", CFSTR("com.apple.link.systemProtocol.Sting"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)stingProtocol_value;
  stingProtocol_value = v0;

}

void __40__LNSystemProtocol_startWorkoutProtocol__block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;

  +[LNSystemProtocol allProtocolsByIdentifier](LNSystemProtocol, "allProtocolsByIdentifier");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "valueForKey:", CFSTR("com.apple.link.systemProtocol.StartWorkout"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)startWorkoutProtocol_value;
  startWorkoutProtocol_value = v0;

}

void __37__LNSystemProtocol_startDiveProtocol__block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;

  +[LNSystemProtocol allProtocolsByIdentifier](LNSystemProtocol, "allProtocolsByIdentifier");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "valueForKey:", CFSTR("com.apple.link.systemProtocol.StartDive"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)startDiveProtocol_value;
  startDiveProtocol_value = v0;

}

void __36__LNSystemProtocol_setValueProtocol__block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;

  +[LNSystemProtocol allProtocolsByIdentifier](LNSystemProtocol, "allProtocolsByIdentifier");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "valueForKey:", CFSTR("com.apple.link.systemProtocol.SetValue"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)setValueProtocol_value;
  setValueProtocol_value = v0;

}

void __43__LNSystemProtocol_sessionStartingProtocol__block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;

  +[LNSystemProtocol allProtocolsByIdentifier](LNSystemProtocol, "allProtocolsByIdentifier");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "valueForKey:", CFSTR("com.apple.link.systemProtocol.SessionStarting"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)sessionStartingProtocol_value;
  sessionStartingProtocol_value = v0;

}

void __40__LNSystemProtocol_searchSystemProtocol__block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;

  +[LNSystemProtocol allProtocolsByIdentifier](LNSystemProtocol, "allProtocolsByIdentifier");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "valueForKey:", CFSTR("com.apple.link.systemProtocol.Search"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)searchSystemProtocol_value;
  searchSystemProtocol_value = v0;

}

void __34__LNSystemProtocol_scrollProtocol__block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;

  +[LNSystemProtocol allProtocolsByIdentifier](LNSystemProtocol, "allProtocolsByIdentifier");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "valueForKey:", CFSTR("com.apple.link.systemProtocol.Scroll"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)scrollProtocol_value;
  scrollProtocol_value = v0;

}

void __44__LNSystemProtocol_saveEntitySystemProtocol__block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;

  +[LNSystemProtocol allProtocolsByIdentifier](LNSystemProtocol, "allProtocolsByIdentifier");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "valueForKey:", CFSTR("com.apple.link.systemProtocol.SaveEntity"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)saveEntitySystemProtocol_value;
  saveEntitySystemProtocol_value = v0;

}

void __41__LNSystemProtocol_resumeWorkoutProtocol__block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;

  +[LNSystemProtocol allProtocolsByIdentifier](LNSystemProtocol, "allProtocolsByIdentifier");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "valueForKey:", CFSTR("com.apple.link.systemProtocol.ResumeWorkout"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)resumeWorkoutProtocol_value;
  resumeWorkoutProtocol_value = v0;

}

void __34__LNSystemProtocol_resizeProtocol__block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;

  +[LNSystemProtocol allProtocolsByIdentifier](LNSystemProtocol, "allProtocolsByIdentifier");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "valueForKey:", CFSTR("com.apple.link.systemProtocol.Resize"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)resizeProtocol_value;
  resizeProtocol_value = v0;

}

void __45__LNSystemProtocol_requiresMDMChecksProtocol__block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;

  +[LNSystemProtocol allProtocolsByIdentifier](LNSystemProtocol, "allProtocolsByIdentifier");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "valueForKey:", CFSTR("com.apple.link.systemProtocol.RequiresMDMChecks"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)requiresMDMChecksProtocol_value;
  requiresMDMChecksProtocol_value = v0;

}

void __48__LNSystemProtocol_putEntityInContainerProtocol__block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;

  +[LNSystemProtocol allProtocolsByIdentifier](LNSystemProtocol, "allProtocolsByIdentifier");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "valueForKey:", CFSTR("com.apple.link.systemProtocol.PutEntityInContainer"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)putEntityInContainerProtocol_value;
  putEntityInContainerProtocol_value = v0;

}

void __43__LNSystemProtocol_propertyUpdaterProtocol__block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;

  +[LNSystemProtocol allProtocolsByIdentifier](LNSystemProtocol, "allProtocolsByIdentifier");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "valueForKey:", CFSTR("com.apple.link.systemProtocol.PropertyUpdater"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)propertyUpdaterProtocol_value;
  propertyUpdaterProtocol_value = v0;

}

void __45__LNSystemProtocol_progressReportingProtocol__block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;

  +[LNSystemProtocol allProtocolsByIdentifier](LNSystemProtocol, "allProtocolsByIdentifier");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "valueForKey:", CFSTR("com.apple.link.systemProtocol.ProgressReporting"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)progressReportingProtocol_value;
  progressReportingProtocol_value = v0;

}

void __41__LNSystemProtocol_previewEntityProtocol__block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;

  +[LNSystemProtocol allProtocolsByIdentifier](LNSystemProtocol, "allProtocolsByIdentifier");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "valueForKey:", CFSTR("com.apple.link.systemProtocol.PreviewEntity"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)previewEntityProtocol_value;
  previewEntityProtocol_value = v0;

}

void __40__LNSystemProtocol_pauseWorkoutProtocol__block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;

  +[LNSystemProtocol allProtocolsByIdentifier](LNSystemProtocol, "allProtocolsByIdentifier");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "valueForKey:", CFSTR("com.apple.link.systemProtocol.PauseWorkout"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)pauseWorkoutProtocol_value;
  pauseWorkoutProtocol_value = v0;

}

void __39__LNSystemProtocol_pasteSystemProtocol__block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;

  +[LNSystemProtocol allProtocolsByIdentifier](LNSystemProtocol, "allProtocolsByIdentifier");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "valueForKey:", CFSTR("com.apple.link.systemProtocol.Paste"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)pasteSystemProtocol_value;
  pasteSystemProtocol_value = v0;

}

void __44__LNSystemProtocol_openEntitySystemProtocol__block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;

  +[LNSystemProtocol allProtocolsByIdentifier](LNSystemProtocol, "allProtocolsByIdentifier");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "valueForKey:", CFSTR("com.apple.link.systemProtocol.OpenEntity"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)openEntitySystemProtocol_value;
  openEntitySystemProtocol_value = v0;

}

void __48__LNSystemProtocol_navigateSequentiallyProtocol__block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;

  +[LNSystemProtocol allProtocolsByIdentifier](LNSystemProtocol, "allProtocolsByIdentifier");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "valueForKey:", CFSTR("com.apple.link.systemProtocol.NavigateSequentially"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)navigateSequentiallyProtocol_value;
  navigateSequentiallyProtocol_value = v0;

}

void __39__LNSystemProtocol_moveSpatialProtocol__block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;

  +[LNSystemProtocol allProtocolsByIdentifier](LNSystemProtocol, "allProtocolsByIdentifier");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "valueForKey:", CFSTR("com.apple.link.systemProtocol.MoveSpatial"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)moveSpatialProtocol_value;
  moveSpatialProtocol_value = v0;

}

void __49__LNSystemProtocol_foregroundContinuableProtocol__block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;

  +[LNSystemProtocol allProtocolsByIdentifier](LNSystemProtocol, "allProtocolsByIdentifier");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "valueForKey:", CFSTR("com.apple.link.systemProtocol.ForegroundContinuable"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)foregroundContinuableProtocol_value;
  foregroundContinuableProtocol_value = v0;

}

void __42__LNSystemProtocol_favoriteEntityProtocol__block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;

  +[LNSystemProtocol allProtocolsByIdentifier](LNSystemProtocol, "allProtocolsByIdentifier");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "valueForKey:", CFSTR("com.apple.link.systemProtocol.FavoriteEntity"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)favoriteEntityProtocol_value;
  favoriteEntityProtocol_value = v0;

}

void __38__LNSystemProtocol_exitMarkupProtocol__block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;

  +[LNSystemProtocol allProtocolsByIdentifier](LNSystemProtocol, "allProtocolsByIdentifier");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "valueForKey:", CFSTR("com.apple.link.systemProtocol.ExitMarkup"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)exitMarkupProtocol_value;
  exitMarkupProtocol_value = v0;

}

void __42__LNSystemProtocol_entityUpdatingProtocol__block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;

  +[LNSystemProtocol allProtocolsByIdentifier](LNSystemProtocol, "allProtocolsByIdentifier");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "valueForKey:", CFSTR("com.apple.link.systemProtocol.EntityUpdating"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)entityUpdatingProtocol_value;
  entityUpdatingProtocol_value = v0;

}

void __39__LNSystemProtocol_enterMarkupProtocol__block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;

  +[LNSystemProtocol allProtocolsByIdentifier](LNSystemProtocol, "allProtocolsByIdentifier");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "valueForKey:", CFSTR("com.apple.link.systemProtocol.EnterMarkup"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)enterMarkupProtocol_value;
  enterMarkupProtocol_value = v0;

}

void __49__LNSystemProtocol_duplicateEntitySystemProtocol__block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;

  +[LNSystemProtocol allProtocolsByIdentifier](LNSystemProtocol, "allProtocolsByIdentifier");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "valueForKey:", CFSTR("com.apple.link.systemProtocol.DuplicateEntity"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)duplicateEntitySystemProtocol_value;
  duplicateEntitySystemProtocol_value = v0;

}

void __46__LNSystemProtocol_deleteEntitySystemProtocol__block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;

  +[LNSystemProtocol allProtocolsByIdentifier](LNSystemProtocol, "allProtocolsByIdentifier");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "valueForKey:", CFSTR("com.apple.link.systemProtocol.DeleteEntity"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)deleteEntitySystemProtocol_value;
  deleteEntitySystemProtocol_value = v0;

}

void __37__LNSystemProtocol_cutSystemProtocol__block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;

  +[LNSystemProtocol allProtocolsByIdentifier](LNSystemProtocol, "allProtocolsByIdentifier");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "valueForKey:", CFSTR("com.apple.link.systemProtocol.Cut"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)cutSystemProtocol_value;
  cutSystemProtocol_value = v0;

}

void __37__LNSystemProtocol_cutEntityProtocol__block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;

  +[LNSystemProtocol allProtocolsByIdentifier](LNSystemProtocol, "allProtocolsByIdentifier");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "valueForKey:", CFSTR("com.apple.link.systemProtocol.CutEntity"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)cutEntityProtocol_value;
  cutEntityProtocol_value = v0;

}

void __46__LNSystemProtocol_createEntitySystemProtocol__block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;

  +[LNSystemProtocol allProtocolsByIdentifier](LNSystemProtocol, "allProtocolsByIdentifier");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "valueForKey:", CFSTR("com.apple.link.systemProtocol.CreateEntity"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)createEntitySystemProtocol_value;
  createEntitySystemProtocol_value = v0;

}

void __38__LNSystemProtocol_copySystemProtocol__block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;

  +[LNSystemProtocol allProtocolsByIdentifier](LNSystemProtocol, "allProtocolsByIdentifier");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "valueForKey:", CFSTR("com.apple.link.systemProtocol.Copy"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)copySystemProtocol_value;
  copySystemProtocol_value = v0;

}

void __38__LNSystemProtocol_copyEntityProtocol__block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;

  +[LNSystemProtocol allProtocolsByIdentifier](LNSystemProtocol, "allProtocolsByIdentifier");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "valueForKey:", CFSTR("com.apple.link.systemProtocol.CopyEntity"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)copyEntityProtocol_value;
  copyEntityProtocol_value = v0;

}

void __48__LNSystemProtocol_conditionallyEnabledProtocol__block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;

  +[LNSystemProtocol allProtocolsByIdentifier](LNSystemProtocol, "allProtocolsByIdentifier");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "valueForKey:", CFSTR("com.apple.link.systemProtocol.ConditionallyEnabled"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)conditionallyEnabledProtocol_value;
  conditionallyEnabledProtocol_value = v0;

}

void __39__LNSystemProtocol_closeEntityProtocol__block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;

  +[LNSystemProtocol allProtocolsByIdentifier](LNSystemProtocol, "allProtocolsByIdentifier");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "valueForKey:", CFSTR("com.apple.link.systemProtocol.CloseEntity"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)closeEntityProtocol_value;
  closeEntityProtocol_value = v0;

}

void __53__LNSystemProtocol_changeBinarySettingSystemProtocol__block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;

  +[LNSystemProtocol allProtocolsByIdentifier](LNSystemProtocol, "allProtocolsByIdentifier");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "valueForKey:", CFSTR("com.apple.link.systemProtocol.ChangeBinarySetting"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)changeBinarySettingSystemProtocol_value;
  changeBinarySettingSystemProtocol_value = v0;

}

void __34__LNSystemProtocol_cancelProtocol__block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;

  +[LNSystemProtocol allProtocolsByIdentifier](LNSystemProtocol, "allProtocolsByIdentifier");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "valueForKey:", CFSTR("com.apple.link.systemProtocol.Cancel"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)cancelProtocol_value;
  cancelProtocol_value = v0;

}

void __42__LNSystemProtocol_audioRecordingProtocol__block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;

  +[LNSystemProtocol allProtocolsByIdentifier](LNSystemProtocol, "allProtocolsByIdentifier");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "valueForKey:", CFSTR("com.apple.link.systemProtocol.AudioRecording"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)audioRecordingProtocol_value;
  audioRecordingProtocol_value = v0;

}

void __41__LNSystemProtocol_audioStartingProtocol__block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;

  +[LNSystemProtocol allProtocolsByIdentifier](LNSystemProtocol, "allProtocolsByIdentifier");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "valueForKey:", CFSTR("com.apple.link.systemProtocol.AudioStarting"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)audioStartingProtocol_value;
  audioStartingProtocol_value = v0;

}

- (int64_t)kind
{
  void *v3;
  void *v4;
  void *v5;
  int64_t v6;

  objc_msgSend((id)objc_opt_class(), "systemProtocolKindsByIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[LNSystemProtocol identifier](self, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    v6 = objc_msgSend(v5, "integerValue");
  else
    v6 = 23;

  return v6;
}

+ (id)systemProtocolKindsByIdentifier
{
  _QWORD v3[21];
  _QWORD v4[22];

  v4[21] = *MEMORY[0x1E0C80C00];
  v3[0] = CFSTR("com.apple.link.systemProtocol.ChangeBinarySetting");
  v3[1] = CFSTR("com.apple.link.systemProtocol.DeleteEntity");
  v4[0] = &unk_1E39B49D0;
  v4[1] = &unk_1E39B49E8;
  v3[2] = CFSTR("com.apple.link.systemProtocol.DuplicateEntity");
  v3[3] = CFSTR("com.apple.link.systemProtocol.OpenEntity");
  v4[2] = &unk_1E39B4A00;
  v4[3] = &unk_1E39B4A18;
  v3[4] = CFSTR("com.apple.link.systemProtocol.SaveEntity");
  v3[5] = CFSTR("com.apple.link.systemProtocol.Undo");
  v4[4] = &unk_1E39B4A30;
  v4[5] = &unk_1E39B4A48;
  v3[6] = CFSTR("com.apple.link.systemProtocol.CreateEntity");
  v3[7] = CFSTR("com.apple.link.systemProtocol.Search");
  v4[6] = &unk_1E39B4A60;
  v4[7] = &unk_1E39B4A78;
  v3[8] = CFSTR("com.apple.link.systemProtocol.Copy");
  v3[9] = CFSTR("com.apple.link.systemProtocol.Paste");
  v4[8] = &unk_1E39B4A90;
  v4[9] = &unk_1E39B4AA8;
  v3[10] = CFSTR("com.apple.link.systemProtocol.Cut");
  v3[11] = CFSTR("com.apple.link.systemProtocol.PutEntityInContainer");
  v4[10] = &unk_1E39B4AC0;
  v4[11] = &unk_1E39B4AD8;
  v3[12] = CFSTR("com.apple.link.systemProtocol.FavoriteEntity");
  v3[13] = CFSTR("com.apple.link.systemProtocol.CloseEntity");
  v4[12] = &unk_1E39B4AF0;
  v4[13] = &unk_1E39B4B08;
  v3[14] = CFSTR("com.apple.link.systemProtocol.Sting");
  v3[15] = CFSTR("com.apple.link.systemProtocol.Cancel");
  v4[14] = &unk_1E39B4B20;
  v4[15] = &unk_1E39B4B38;
  v3[16] = CFSTR("com.apple.link.systemProtocol.NavigateSequentially");
  v3[17] = CFSTR("com.apple.link.systemProtocol.MoveSpatial");
  v4[16] = &unk_1E39B4B50;
  v4[17] = &unk_1E39B4B68;
  v3[18] = CFSTR("com.apple.link.systemProtocol.Scroll");
  v3[19] = CFSTR("com.apple.link.systemProtocol.Resize");
  v4[18] = &unk_1E39B4B80;
  v4[19] = &unk_1E39B4B98;
  v3[20] = CFSTR("com.apple.link.systemProtocol.Zoom");
  v4[20] = &unk_1E39B4BB0;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v4, v3, 21);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (LNSystemProtocol)protocolWithIdentifier:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  objc_msgSend(a1, "protocolOrNilWithIdentifier:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("InitNotImplemented"), CFSTR("%@ is not a valid LNSystemProtocolIdentifier"), v4);

  return (LNSystemProtocol *)v5;
}

+ (id)ofKind:(int64_t)a3
{
  void *v3;
  int64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  if (a3 == 23)
  {
    v3 = 0;
  }
  else
  {
    if (a3 == 13)
      v4 = 14;
    else
      v4 = a3;
    objc_msgSend(a1, "systemProtocolKindsByIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "allKeysForObject:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "firstObject");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      +[LNSystemProtocol protocolWithIdentifier:](LNSystemProtocol, "protocolWithIdentifier:", v8);
      v3 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v3 = 0;
    }

  }
  return v3;
}

@end
