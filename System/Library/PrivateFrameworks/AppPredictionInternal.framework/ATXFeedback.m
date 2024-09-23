@implementation ATXFeedback

void __51___ATXFeedback_initWithDataStore_histogramManager___block_invoke(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "removeFeedbackForBundles:", v3);

}

void __30___ATXFeedback_sharedInstance__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;

  v0 = (void *)MEMORY[0x1CAA48B6C]();
  v1 = objc_opt_new();
  v2 = (void *)sharedInstance__pasExprOnceResult_26;
  sharedInstance__pasExprOnceResult_26 = v1;

  objc_autoreleasePoolPop(v0);
}

void __49___ATXFeedback_loadHistogramsInMemoryIfNecessary__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  _QWORD *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  void *v36;
  uint64_t v37;
  void *v38;
  uint64_t v39;
  void *v40;
  uint64_t v41;
  void *v42;
  uint64_t v43;
  void *v44;
  uint64_t v45;
  void *v46;
  uint64_t v47;
  void *v48;
  uint64_t v49;
  void *v50;
  uint64_t v51;
  void *v52;
  uint64_t v53;
  void *v54;
  uint64_t v55;
  void *v56;
  uint64_t v57;
  void *v58;
  uint64_t v59;
  void *v60;
  uint64_t v61;
  void *v62;
  uint64_t v63;
  void *v64;
  uint64_t v65;
  void *v66;
  uint64_t v67;
  void *v68;
  uint64_t v69;
  void *v70;
  uint64_t v71;
  void *v72;
  uint64_t v73;
  void *v74;
  uint64_t v75;
  void *v76;
  uint64_t v77;
  void *v78;
  uint64_t v79;
  void *v80;
  uint64_t v81;
  id v82;

  v3 = *(void **)(*(_QWORD *)(a1 + 32) + 48);
  v4 = a2;
  objc_msgSend(v3, "categoricalHistogramForLaunchType:", 45);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v4[1];
  v4[1] = v5;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "categoricalHistogramForLaunchType:", 46);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v4[2];
  v4[2] = v7;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "categoricalHistogramForLaunchType:", 47);
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)v4[3];
  v4[3] = v9;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "categoricalHistogramForLaunchType:", 48);
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = (void *)v4[4];
  v4[4] = v11;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "categoricalHistogramForLaunchType:", 53);
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = (void *)v4[5];
  v4[5] = v13;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "categoricalHistogramForLaunchType:", 54);
  v15 = objc_claimAutoreleasedReturnValue();
  v16 = (void *)v4[6];
  v4[6] = v15;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "categoricalHistogramForLaunchType:", 55);
  v17 = objc_claimAutoreleasedReturnValue();
  v18 = (void *)v4[7];
  v4[7] = v17;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "categoricalHistogramForLaunchType:", 56);
  v19 = objc_claimAutoreleasedReturnValue();
  v20 = (void *)v4[8];
  v4[8] = v19;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "categoricalHistogramForLaunchType:", 57);
  v21 = objc_claimAutoreleasedReturnValue();
  v22 = (void *)v4[9];
  v4[9] = v21;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "categoricalHistogramForLaunchType:", 58);
  v23 = objc_claimAutoreleasedReturnValue();
  v24 = (void *)v4[10];
  v4[10] = v23;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "categoricalHistogramForLaunchType:", 59);
  v25 = objc_claimAutoreleasedReturnValue();
  v26 = (void *)v4[11];
  v4[11] = v25;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "categoricalHistogramForLaunchType:", 60);
  v27 = objc_claimAutoreleasedReturnValue();
  v28 = (void *)v4[12];
  v4[12] = v27;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "categoricalHistogramForLaunchType:", 87);
  v29 = objc_claimAutoreleasedReturnValue();
  v30 = (void *)v4[13];
  v4[13] = v29;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "categoricalHistogramForLaunchType:", 63);
  v31 = objc_claimAutoreleasedReturnValue();
  v32 = (void *)v4[14];
  v4[14] = v31;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "categoricalHistogramForLaunchType:", 64);
  v33 = objc_claimAutoreleasedReturnValue();
  v34 = (void *)v4[15];
  v4[15] = v33;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "categoricalHistogramForLaunchType:", 65);
  v35 = objc_claimAutoreleasedReturnValue();
  v36 = (void *)v4[16];
  v4[16] = v35;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "categoricalHistogramForLaunchType:", 66);
  v37 = objc_claimAutoreleasedReturnValue();
  v38 = (void *)v4[17];
  v4[17] = v37;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "categoricalHistogramForLaunchType:", 67);
  v39 = objc_claimAutoreleasedReturnValue();
  v40 = (void *)v4[18];
  v4[18] = v39;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "categoricalHistogramForLaunchType:", 68);
  v41 = objc_claimAutoreleasedReturnValue();
  v42 = (void *)v4[19];
  v4[19] = v41;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "categoricalHistogramForLaunchType:", 69);
  v43 = objc_claimAutoreleasedReturnValue();
  v44 = (void *)v4[20];
  v4[20] = v43;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "categoricalHistogramForLaunchType:", 70);
  v45 = objc_claimAutoreleasedReturnValue();
  v46 = (void *)v4[21];
  v4[21] = v45;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "categoricalHistogramForLaunchType:", 71);
  v47 = objc_claimAutoreleasedReturnValue();
  v48 = (void *)v4[22];
  v4[22] = v47;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "categoricalHistogramForLaunchType:", 72);
  v49 = objc_claimAutoreleasedReturnValue();
  v50 = (void *)v4[23];
  v4[23] = v49;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "categoricalHistogramForLaunchType:", 73);
  v51 = objc_claimAutoreleasedReturnValue();
  v52 = (void *)v4[24];
  v4[24] = v51;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "categoricalHistogramForLaunchType:", 74);
  v53 = objc_claimAutoreleasedReturnValue();
  v54 = (void *)v4[25];
  v4[25] = v53;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "categoricalHistogramForLaunchType:", 88);
  v55 = objc_claimAutoreleasedReturnValue();
  v56 = (void *)v4[26];
  v4[26] = v55;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "categoricalHistogramForLaunchType:", 75);
  v57 = objc_claimAutoreleasedReturnValue();
  v58 = (void *)v4[27];
  v4[27] = v57;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "categoricalHistogramForLaunchType:", 76);
  v59 = objc_claimAutoreleasedReturnValue();
  v60 = (void *)v4[28];
  v4[28] = v59;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "categoricalHistogramForLaunchType:", 77);
  v61 = objc_claimAutoreleasedReturnValue();
  v62 = (void *)v4[29];
  v4[29] = v61;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "categoricalHistogramForLaunchType:", 78);
  v63 = objc_claimAutoreleasedReturnValue();
  v64 = (void *)v4[30];
  v4[30] = v63;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "categoricalHistogramForLaunchType:", 79);
  v65 = objc_claimAutoreleasedReturnValue();
  v66 = (void *)v4[31];
  v4[31] = v65;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "categoricalHistogramForLaunchType:", 80);
  v67 = objc_claimAutoreleasedReturnValue();
  v68 = (void *)v4[32];
  v4[32] = v67;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "categoricalHistogramForLaunchType:", 81);
  v69 = objc_claimAutoreleasedReturnValue();
  v70 = (void *)v4[33];
  v4[33] = v69;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "categoricalHistogramForLaunchType:", 82);
  v71 = objc_claimAutoreleasedReturnValue();
  v72 = (void *)v4[34];
  v4[34] = v71;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "categoricalHistogramForLaunchType:", 83);
  v73 = objc_claimAutoreleasedReturnValue();
  v74 = (void *)v4[35];
  v4[35] = v73;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "categoricalHistogramForLaunchType:", 84);
  v75 = objc_claimAutoreleasedReturnValue();
  v76 = (void *)v4[36];
  v4[36] = v75;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "categoricalHistogramForLaunchType:", 85);
  v77 = objc_claimAutoreleasedReturnValue();
  v78 = (void *)v4[37];
  v4[37] = v77;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "categoricalHistogramForLaunchType:", 86);
  v79 = objc_claimAutoreleasedReturnValue();
  v80 = (void *)v4[38];
  v4[38] = v79;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "categoricalHistogramForLaunchType:", 89);
  v81 = objc_claimAutoreleasedReturnValue();
  v82 = (id)v4[39];
  v4[39] = v81;

}

void __38___ATXFeedback_unloadCachedHistograms__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  _QWORD *v43;

  v43 = a2;
  v3 = (void *)MEMORY[0x1CAA48B6C]();
  v4 = (void *)v43[1];
  v43[1] = 0;

  v5 = (void *)v43[2];
  v43[2] = 0;

  v6 = (void *)v43[3];
  v43[3] = 0;

  v7 = (void *)v43[4];
  v43[4] = 0;

  v8 = (void *)v43[5];
  v43[5] = 0;

  v9 = (void *)v43[6];
  v43[6] = 0;

  v10 = (void *)v43[7];
  v43[7] = 0;

  v11 = (void *)v43[8];
  v43[8] = 0;

  v12 = (void *)v43[9];
  v43[9] = 0;

  v13 = (void *)v43[10];
  v43[10] = 0;

  v14 = (void *)v43[11];
  v43[11] = 0;

  v15 = (void *)v43[12];
  v43[12] = 0;

  v16 = (void *)v43[13];
  v43[13] = 0;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "purgeHistogramForLaunchType:", 45);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "purgeHistogramForLaunchType:", 46);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "purgeHistogramForLaunchType:", 47);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "purgeHistogramForLaunchType:", 48);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "purgeHistogramForLaunchType:", 53);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "purgeHistogramForLaunchType:", 54);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "purgeHistogramForLaunchType:", 55);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "purgeHistogramForLaunchType:", 56);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "purgeHistogramForLaunchType:", 57);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "purgeHistogramForLaunchType:", 58);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "purgeHistogramForLaunchType:", 59);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "purgeHistogramForLaunchType:", 60);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "purgeHistogramForLaunchType:", 87);
  v17 = (void *)v43[14];
  v43[14] = 0;

  v18 = (void *)v43[15];
  v43[15] = 0;

  v19 = (void *)v43[16];
  v43[16] = 0;

  v20 = (void *)v43[17];
  v43[17] = 0;

  v21 = (void *)v43[18];
  v43[18] = 0;

  v22 = (void *)v43[19];
  v43[19] = 0;

  v23 = (void *)v43[20];
  v43[20] = 0;

  v24 = (void *)v43[21];
  v43[21] = 0;

  v25 = (void *)v43[22];
  v43[22] = 0;

  v26 = (void *)v43[23];
  v43[23] = 0;

  v27 = (void *)v43[24];
  v43[24] = 0;

  v28 = (void *)v43[25];
  v43[25] = 0;

  v29 = (void *)v43[26];
  v43[26] = 0;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "purgeHistogramForLaunchType:", 63);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "purgeHistogramForLaunchType:", 64);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "purgeHistogramForLaunchType:", 65);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "purgeHistogramForLaunchType:", 66);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "purgeHistogramForLaunchType:", 67);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "purgeHistogramForLaunchType:", 68);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "purgeHistogramForLaunchType:", 69);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "purgeHistogramForLaunchType:", 70);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "purgeHistogramForLaunchType:", 71);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "purgeHistogramForLaunchType:", 72);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "purgeHistogramForLaunchType:", 73);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "purgeHistogramForLaunchType:", 74);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "purgeHistogramForLaunchType:", 88);
  v30 = (void *)v43[27];
  v43[27] = 0;

  v31 = (void *)v43[28];
  v43[28] = 0;

  v32 = (void *)v43[29];
  v43[29] = 0;

  v33 = (void *)v43[30];
  v43[30] = 0;

  v34 = (void *)v43[31];
  v43[31] = 0;

  v35 = (void *)v43[32];
  v43[32] = 0;

  v36 = (void *)v43[33];
  v43[33] = 0;

  v37 = (void *)v43[34];
  v43[34] = 0;

  v38 = (void *)v43[35];
  v43[35] = 0;

  v39 = (void *)v43[36];
  v43[36] = 0;

  v40 = (void *)v43[37];
  v43[37] = 0;

  v41 = (void *)v43[38];
  v43[38] = 0;

  v42 = (void *)v43[39];
  v43[39] = 0;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "purgeHistogramForLaunchType:", 75);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "purgeHistogramForLaunchType:", 76);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "purgeHistogramForLaunchType:", 77);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "purgeHistogramForLaunchType:", 78);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "purgeHistogramForLaunchType:", 79);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "purgeHistogramForLaunchType:", 80);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "purgeHistogramForLaunchType:", 81);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "purgeHistogramForLaunchType:", 82);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "purgeHistogramForLaunchType:", 83);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "purgeHistogramForLaunchType:", 84);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "purgeHistogramForLaunchType:", 85);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "purgeHistogramForLaunchType:", 86);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "purgeHistogramForLaunchType:", 89);
  objc_autoreleasePoolPop(v3);

}

void __30___ATXFeedback_doDecayAtTime___block_invoke(uint64_t a1, double *a2)
{
  double v4;
  double v5;
  double v7;
  double v8;

  v4 = *(double *)(a1 + 40);
  v5 = v4 - *a2;
  if (*a2 > 0.0 && v5 > 30.0)
  {
    +[_ATXFeedbackConstants decayHalfLifeSeconds](_ATXFeedbackConstants, "decayHalfLifeSeconds");
    *(long double *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = exp2(-v5 / v7);
    v4 = *(double *)(a1 + 40);
  }
  *a2 = v4;
  v8 = a2[2];
  a2[1] = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) * a2[1];
  a2[2] = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) * v8;
}

double __30___ATXFeedback_doDecayAtTime___block_invoke_2(uint64_t a1, uint64_t a2, double *a3)
{
  double v3;
  double result;

  v3 = a3[1];
  *a3 = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) * *a3;
  result = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) * v3;
  a3[1] = result;
  return result;
}

void __97___ATXFeedback_feedbackLaunchedWithConsumerType_forBundleId_rejected_explicitlyRejected_context___block_invoke(uint64_t a1, void *a2, double *a3)
{
  id WeakRetained;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  id v11;

  v11 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "isEqualToString:"))
  {
    if (objc_msgSend((id)objc_opt_class(), "isWidgetOrSpotlight:", *(_QWORD *)(a1 + 88)))
    {
      *a3 = *a3 + 1.0;
      ++*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24);
    }
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 80));
    v6 = WeakRetained;
    v7 = *(_QWORD *)(a1 + 88);
    v8 = *(_QWORD *)(a1 + 48);
    v9 = v11;
    v10 = 0;
  }
  else if (objc_msgSend(*(id *)(a1 + 56), "containsObject:", v11))
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 80));
    v6 = WeakRetained;
    v7 = *(_QWORD *)(a1 + 88);
    v8 = *(_QWORD *)(a1 + 48);
    v9 = v11;
    v10 = 2;
  }
  else
  {
    if (objc_msgSend((id)objc_opt_class(), "isWidgetOrSpotlight:", *(_QWORD *)(a1 + 88)))
    {
      a3[1] = a3[1] + 1.0;
      ++*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24);
    }
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 80));
    v6 = WeakRetained;
    v7 = *(_QWORD *)(a1 + 88);
    v8 = *(_QWORD *)(a1 + 48);
    v9 = v11;
    v10 = 1;
  }
  objc_msgSend(WeakRetained, "populateFeedbackForConsumerType:forBundleId:withContext:forFeedbackCategory:", v7, v9, v8, v10);

}

double __97___ATXFeedback_feedbackLaunchedWithConsumerType_forBundleId_rejected_explicitlyRejected_context___block_invoke_2(uint64_t a1, uint64_t a2)
{
  double v2;
  double result;

  v2 = *(double *)(a2 + 16);
  *(double *)(a2 + 8) = *(double *)(a2 + 8) + (double)*(int *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  result = v2 + (double)*(int *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
  *(double *)(a2 + 16) = result;
  return result;
}

void __92___ATXFeedback_populateFeedbackForConsumerType_forBundleId_withContext_forFeedbackCategory___block_invoke(uint64_t a1, void *a2)
{
  _QWORD *v3;
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  uint64_t v39;
  void *v40;
  void *v41;
  void *v42;
  uint64_t v43;
  void *v44;
  void *v45;
  void *v46;
  uint64_t v47;
  void *v48;
  void *v49;
  uint64_t v50;
  void *v51;
  uint64_t v52;
  void *v53;
  void *v54;
  void *v55;
  uint64_t v56;
  void *v57;
  void *v58;
  void *v59;
  uint64_t v60;
  void *v61;
  void *v62;
  void *v63;
  uint64_t v64;
  void *v65;
  void *v66;
  void *v67;
  uint64_t v68;
  void *v69;
  void *v70;
  void *v71;
  uint64_t v72;
  void *v73;
  void *v74;
  void *v75;
  uint64_t v76;
  void *v77;
  void *v78;
  void *v79;
  uint64_t v80;
  void *v81;
  void *v82;
  void *v83;
  uint64_t v84;
  void *v85;
  void *v86;
  void *v87;
  uint64_t v88;
  void *v89;
  void *v90;
  NSObject *v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  void *v98;
  uint64_t v99;
  void *v100;
  void *v101;
  void *v102;
  uint64_t v103;
  void *v104;
  void *v105;
  void *v106;
  uint64_t v107;
  void *v108;
  void *v109;
  void *v110;
  uint64_t v111;
  void *v112;
  void *v113;
  void *v114;
  uint64_t v115;
  void *v116;
  void *v117;
  uint64_t v118;
  void *v119;
  void *v120;
  uint64_t v121;
  void *v122;
  uint64_t v123;
  void *v124;
  void *v125;
  void *v126;
  uint64_t v127;
  void *v128;
  void *v129;
  void *v130;
  uint64_t v131;
  void *v132;
  void *v133;
  void *v134;
  uint64_t v135;
  void *v136;
  void *v137;
  void *v138;
  uint64_t v139;
  void *v140;
  void *v141;

  v3 = a2;
  v4 = v3;
  v5 = *(_QWORD *)(a1 + 96);
  if ((unint64_t)(v5 - 1) < 2)
  {
    v7 = (_QWORD *)(a1 + 104);
    v29 = *(_QWORD *)(a1 + 104);
    if (v29 != 2)
    {
      if (v29 == 1)
      {
        v71 = (void *)v3[3];
        v72 = *(_QWORD *)(a1 + 32);
        objc_msgSend(*(id *)(a1 + 40), "timeContext");
        v73 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v73, "date");
        v74 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v71, "addLaunchWithBundleId:date:category:", v72, v74, *(_QWORD *)(a1 + 48));

        v75 = (void *)v4[4];
        v76 = *(_QWORD *)(a1 + 32);
        objc_msgSend(*(id *)(a1 + 40), "timeContext");
        v77 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v77, "date");
        v78 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v75, "addLaunchWithBundleId:date:category:", v76, v78, *(_QWORD *)(a1 + 56));

        v79 = (void *)v4[6];
        v80 = *(_QWORD *)(a1 + 32);
        objc_msgSend(*(id *)(a1 + 40), "timeContext");
        v81 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v81, "date");
        v82 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v79, "addLaunchWithBundleId:date:category:", v80, v82, *(_QWORD *)(a1 + 64));

        v83 = (void *)v4[8];
        v84 = *(_QWORD *)(a1 + 32);
        objc_msgSend(*(id *)(a1 + 40), "timeContext");
        v85 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v85, "date");
        v86 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v83, "addLaunchWithBundleId:date:category:", v84, v86, *(_QWORD *)(a1 + 72));

        v87 = (void *)v4[10];
        v88 = *(_QWORD *)(a1 + 32);
        objc_msgSend(*(id *)(a1 + 40), "timeContext");
        v89 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v89, "date");
        v90 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v87, "addLaunchWithBundleId:date:category:", v88, v90, *(_QWORD *)(a1 + 80));

        v28 = (void *)v4[12];
        goto LABEL_27;
      }
      if (!v29)
      {
        v30 = (void *)v3[1];
        v31 = *(_QWORD *)(a1 + 32);
        objc_msgSend(*(id *)(a1 + 40), "timeContext");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "date");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "addLaunchWithBundleId:date:category:", v31, v33, *(_QWORD *)(a1 + 48));

        v34 = (void *)v4[2];
        v35 = *(_QWORD *)(a1 + 32);
        objc_msgSend(*(id *)(a1 + 40), "timeContext");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "date");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "addLaunchWithBundleId:date:category:", v35, v37, *(_QWORD *)(a1 + 56));

        v38 = (void *)v4[5];
        v39 = *(_QWORD *)(a1 + 32);
        objc_msgSend(*(id *)(a1 + 40), "timeContext");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v40, "date");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v38, "addLaunchWithBundleId:date:category:", v39, v41, *(_QWORD *)(a1 + 64));

        v42 = (void *)v4[7];
        v43 = *(_QWORD *)(a1 + 32);
        objc_msgSend(*(id *)(a1 + 40), "timeContext");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v44, "date");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v42, "addLaunchWithBundleId:date:category:", v43, v45, *(_QWORD *)(a1 + 72));

        v46 = (void *)v4[9];
        v47 = *(_QWORD *)(a1 + 32);
        objc_msgSend(*(id *)(a1 + 40), "timeContext");
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v48, "date");
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v46, "addLaunchWithBundleId:date:category:", v47, v49, *(_QWORD *)(a1 + 80));

        v28 = (void *)v4[11];
        goto LABEL_27;
      }
      __atxlog_handle_default();
      v91 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v91, OS_LOG_TYPE_ERROR))
        goto LABEL_30;
      goto LABEL_31;
    }
    v28 = (void *)v3[13];
    goto LABEL_25;
  }
  if (v5 == 15)
  {
    v7 = (_QWORD *)(a1 + 104);
    v50 = *(_QWORD *)(a1 + 104);
    if (v50 != 2)
    {
      if (v50 == 1)
      {
        v122 = (void *)v3[33];
        v123 = *(_QWORD *)(a1 + 32);
        objc_msgSend(*(id *)(a1 + 40), "timeContext");
        v124 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v124, "date");
        v125 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v122, "addLaunchWithBundleId:date:category:", v123, v125, *(_QWORD *)(a1 + 48));

        v126 = (void *)v4[34];
        v127 = *(_QWORD *)(a1 + 32);
        objc_msgSend(*(id *)(a1 + 40), "timeContext");
        v128 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v128, "date");
        v129 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v126, "addLaunchWithBundleId:date:category:", v127, v129, *(_QWORD *)(a1 + 56));

        v130 = (void *)v4[35];
        v131 = *(_QWORD *)(a1 + 32);
        objc_msgSend(*(id *)(a1 + 40), "timeContext");
        v132 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v132, "date");
        v133 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v130, "addLaunchWithBundleId:date:category:", v131, v133, *(_QWORD *)(a1 + 64));

        v134 = (void *)v4[36];
        v135 = *(_QWORD *)(a1 + 32);
        objc_msgSend(*(id *)(a1 + 40), "timeContext");
        v136 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v136, "date");
        v137 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v134, "addLaunchWithBundleId:date:category:", v135, v137, *(_QWORD *)(a1 + 72));

        v138 = (void *)v4[37];
        v139 = *(_QWORD *)(a1 + 32);
        objc_msgSend(*(id *)(a1 + 40), "timeContext");
        v140 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v140, "date");
        v141 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v138, "addLaunchWithBundleId:date:category:", v139, v141, *(_QWORD *)(a1 + 80));

        v28 = (void *)v4[38];
        goto LABEL_27;
      }
      if (!v50)
      {
        v51 = (void *)v3[27];
        v52 = *(_QWORD *)(a1 + 32);
        objc_msgSend(*(id *)(a1 + 40), "timeContext");
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v53, "date");
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v51, "addLaunchWithBundleId:date:category:", v52, v54, *(_QWORD *)(a1 + 48));

        v55 = (void *)v4[28];
        v56 = *(_QWORD *)(a1 + 32);
        objc_msgSend(*(id *)(a1 + 40), "timeContext");
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v57, "date");
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v55, "addLaunchWithBundleId:date:category:", v56, v58, *(_QWORD *)(a1 + 56));

        v59 = (void *)v4[29];
        v60 = *(_QWORD *)(a1 + 32);
        objc_msgSend(*(id *)(a1 + 40), "timeContext");
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v61, "date");
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v59, "addLaunchWithBundleId:date:category:", v60, v62, *(_QWORD *)(a1 + 64));

        v63 = (void *)v4[30];
        v64 = *(_QWORD *)(a1 + 32);
        objc_msgSend(*(id *)(a1 + 40), "timeContext");
        v65 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v65, "date");
        v66 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v63, "addLaunchWithBundleId:date:category:", v64, v66, *(_QWORD *)(a1 + 72));

        v67 = (void *)v4[31];
        v68 = *(_QWORD *)(a1 + 32);
        objc_msgSend(*(id *)(a1 + 40), "timeContext");
        v69 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v69, "date");
        v70 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v67, "addLaunchWithBundleId:date:category:", v68, v70, *(_QWORD *)(a1 + 80));

        v28 = (void *)v4[32];
        goto LABEL_27;
      }
      __atxlog_handle_default();
      v91 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v91, OS_LOG_TYPE_ERROR))
LABEL_30:
        __92___ATXFeedback_populateFeedbackForConsumerType_forBundleId_withContext_forFeedbackCategory___block_invoke_cold_1((uint64_t)v7, v91, v92, v93, v94, v95, v96, v97);
LABEL_31:

      objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("populateFeedbackForConsumerType called with invalid _ATXFeedbackCategory value of %lu"), *v7);
      goto LABEL_32;
    }
    v28 = (void *)v3[39];
LABEL_25:
    v118 = *(_QWORD *)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 40), "timeContext");
    v119 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v119, "date");
    v120 = (void *)objc_claimAutoreleasedReturnValue();
    v121 = *(_QWORD *)(a1 + 48);
LABEL_28:
    objc_msgSend(v28, "addLaunchWithBundleId:date:category:", v118, v120, v121);

    goto LABEL_32;
  }
  if (v5 == 14)
  {
    v7 = (_QWORD *)(a1 + 104);
    v6 = *(_QWORD *)(a1 + 104);
    if (v6 != 2)
    {
      if (v6 == 1)
      {
        v98 = (void *)v3[20];
        v99 = *(_QWORD *)(a1 + 32);
        objc_msgSend(*(id *)(a1 + 40), "timeContext");
        v100 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v100, "date");
        v101 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v98, "addLaunchWithBundleId:date:category:", v99, v101, *(_QWORD *)(a1 + 48));

        v102 = (void *)v4[21];
        v103 = *(_QWORD *)(a1 + 32);
        objc_msgSend(*(id *)(a1 + 40), "timeContext");
        v104 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v104, "date");
        v105 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v102, "addLaunchWithBundleId:date:category:", v103, v105, *(_QWORD *)(a1 + 56));

        v106 = (void *)v4[22];
        v107 = *(_QWORD *)(a1 + 32);
        objc_msgSend(*(id *)(a1 + 40), "timeContext");
        v108 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v108, "date");
        v109 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v106, "addLaunchWithBundleId:date:category:", v107, v109, *(_QWORD *)(a1 + 64));

        v110 = (void *)v4[23];
        v111 = *(_QWORD *)(a1 + 32);
        objc_msgSend(*(id *)(a1 + 40), "timeContext");
        v112 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v112, "date");
        v113 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v110, "addLaunchWithBundleId:date:category:", v111, v113, *(_QWORD *)(a1 + 72));

        v114 = (void *)v4[24];
        v115 = *(_QWORD *)(a1 + 32);
        objc_msgSend(*(id *)(a1 + 40), "timeContext");
        v116 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v116, "date");
        v117 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v114, "addLaunchWithBundleId:date:category:", v115, v117, *(_QWORD *)(a1 + 80));

        v28 = (void *)v4[25];
        goto LABEL_27;
      }
      if (!v6)
      {
        v8 = (void *)v3[14];
        v9 = *(_QWORD *)(a1 + 32);
        objc_msgSend(*(id *)(a1 + 40), "timeContext");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "date");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "addLaunchWithBundleId:date:category:", v9, v11, *(_QWORD *)(a1 + 48));

        v12 = (void *)v4[15];
        v13 = *(_QWORD *)(a1 + 32);
        objc_msgSend(*(id *)(a1 + 40), "timeContext");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "date");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "addLaunchWithBundleId:date:category:", v13, v15, *(_QWORD *)(a1 + 56));

        v16 = (void *)v4[16];
        v17 = *(_QWORD *)(a1 + 32);
        objc_msgSend(*(id *)(a1 + 40), "timeContext");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "date");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "addLaunchWithBundleId:date:category:", v17, v19, *(_QWORD *)(a1 + 64));

        v20 = (void *)v4[17];
        v21 = *(_QWORD *)(a1 + 32);
        objc_msgSend(*(id *)(a1 + 40), "timeContext");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "date");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "addLaunchWithBundleId:date:category:", v21, v23, *(_QWORD *)(a1 + 72));

        v24 = (void *)v4[18];
        v25 = *(_QWORD *)(a1 + 32);
        objc_msgSend(*(id *)(a1 + 40), "timeContext");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "date");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "addLaunchWithBundleId:date:category:", v25, v27, *(_QWORD *)(a1 + 80));

        v28 = (void *)v4[19];
LABEL_27:
        v118 = *(_QWORD *)(a1 + 32);
        objc_msgSend(*(id *)(a1 + 40), "timeContext");
        v119 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v119, "date");
        v120 = (void *)objc_claimAutoreleasedReturnValue();
        v121 = *(_QWORD *)(a1 + 88);
        goto LABEL_28;
      }
      __atxlog_handle_default();
      v91 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v91, OS_LOG_TYPE_ERROR))
        goto LABEL_30;
      goto LABEL_31;
    }
    v28 = (void *)v3[26];
    goto LABEL_25;
  }
LABEL_32:

}

double __69___ATXFeedback_putFeedbackScoresForApps_intoScores_confirms_rejects___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  double result;

  *(double *)(*(_QWORD *)(a1 + 32) + 24) = *(double *)(a1 + 40)
                                           * ((*(double *)(a1 + 48) + *(double *)(a2 + 8))
                                            / (*(double *)(a1 + 40) + *(double *)(a2 + 8) + *(double *)(a2 + 16)));
  v2 = *(_QWORD *)(a1 + 32);
  result = *(double *)(a1 + 40) - *(double *)(v2 + 24);
  *(double *)(v2 + 32) = result;
  return result;
}

void __69___ATXFeedback_putFeedbackScoresForApps_intoScores_confirms_rejects___block_invoke_2(_QWORD *a1, void *a2, double *a3)
{
  id v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  uint64_t v12;
  double *v13;
  uint64_t v14;
  _QWORD *v15;
  uint64_t v16;
  _QWORD *v17;

  v5 = a2;
  +[_ATXFeedbackConstants alphaForBundleId:](_ATXFeedbackConstants, "alphaForBundleId:", v5);
  v7 = v6;
  +[_ATXFeedbackConstants betaForBundleId:](_ATXFeedbackConstants, "betaForBundleId:", v5);
  v9 = v8;

  v10 = _ATXFeedbackComputeBetaMean(v7 + *(double *)(a1[4] + 24), v9 + *(double *)(a1[4] + 32));
  v11 = _ATXFeedbackComputeBetaMean(v7 + *a3 + *(double *)(a1[4] + 24), v9 + a3[1] + *(double *)(a1[4] + 32));
  if (a1[8])
  {
    v12 = *(_QWORD *)(a1[5] + 8);
    v13 = *(double **)(v12 + 24);
    *v13 = v11 / v10;
    *(_QWORD *)(v12 + 24) = v13 + 1;
  }
  if (a1[9])
  {
    v14 = *(_QWORD *)(a1[6] + 8);
    v15 = *(_QWORD **)(v14 + 24);
    *v15 = *(_QWORD *)a3;
    *(_QWORD *)(v14 + 24) = v15 + 1;
  }
  if (a1[10])
  {
    v16 = *(_QWORD *)(a1[7] + 8);
    v17 = *(_QWORD **)(v16 + 24);
    *v17 = *((_QWORD *)a3 + 1);
    *(_QWORD *)(v16 + 24) = v17 + 1;
  }
}

void __92___ATXFeedback_populateFeedbackForConsumerType_forBundleId_withContext_forFeedbackCategory___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1C9A3B000, a2, a3, "populateFeedbackForConsumerType called with invalid _ATXFeedbackCategory value of %lu", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1_0();
}

@end
