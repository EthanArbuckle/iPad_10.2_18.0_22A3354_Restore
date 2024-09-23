@implementation VNBoundingCircleAlgorithm

+ (id)boundingCircleForSIMDPoints:(float32x2_t *)a3 pointCount:(int64_t)a4 aspectRatioForCentroid:(_QWORD *)a5 error:
{
  float64x2_t *v9;
  float32x2_t v10;
  unsigned int rep;
  unsigned int v12;
  void *v13;
  void *v14;
  id v15;
  void *v17;
  void *__p;
  void *v19;
  __int128 v20;

  objc_opt_self();
  if (!a3)
  {
    if (a5)
    {
      +[VNError errorForInvalidArgumentWithLocalizedDescription:](VNError, "errorForInvalidArgumentWithLocalizedDescription:", CFSTR("null points array"));
      *a5 = (id)objc_claimAutoreleasedReturnValue();
      return 0;
    }
    return 0;
  }
  if (a4 <= 0)
  {
    if (a5)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid points count %ld"), a4);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      +[VNError errorForInvalidArgumentWithLocalizedDescription:](VNError, "errorForInvalidArgumentWithLocalizedDescription:", v17);
      *a5 = (id)objc_claimAutoreleasedReturnValue();

    }
    return 0;
  }
  objc_opt_self();
  v20 = 0uLL;
  std::vector<CGPoint>::vector(&__p, a4, &v20);
  v9 = (float64x2_t *)__p;
  do
  {
    v10 = *a3++;
    *v9++ = vcvtq_f64_f32(v10);
    --a4;
  }
  while (a4);
  rep = std::chrono::system_clock::now().__d_.__rep_;
  v12 = rep + ((rep / 0x7FFFFFFF) | ((rep / 0x7FFFFFFF) << 31));
  if (v12 <= 1)
    v12 = 1;
  LODWORD(v20) = v12;
  std::__shuffle[abi:ne180100]<std::_ClassicAlgPolicy,std::__wrap_iter<CGPoint *>,std::__wrap_iter<CGPoint *>,std::linear_congruential_engine<unsigned int,48271u,0u,2147483647u>>((unint64_t)__p, (uint64_t)v19, (uint64_t)&v20);
  +[VNBoundingCircleAlgorithm _boundingCircleForPoints:aspectRatioForCentroid:](a1, (uint64_t)VNBoundingCircleAlgorithm, (double **)&__p);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (v13)
  {
    v15 = v13;
  }
  else if (a5)
  {
    +[VNError errorForInternalErrorWithLocalizedDescription:](VNError, "errorForInternalErrorWithLocalizedDescription:", CFSTR("Cannot calculate minimum enclosing circle for the given set of points"));
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }

  if (__p)
  {
    v19 = __p;
    operator delete(__p);
  }
  return v14;
}

+ (VNCircle)_boundingCircleForPoints:(double *)a3 aspectRatioForCentroid:
{
  double *v4;
  uint64_t v5;
  unint64_t v6;
  _UNKNOWN **v7;
  double v8;
  double v9;
  double v10;
  VNPoint *v11;
  VNVector *v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  __objc2_class **v19;
  VNVector *v20;
  void *v21;
  void *v22;
  double v23;
  double v24;
  double v25;
  double v26;
  id v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  double v37;
  double v38;
  double v39;
  double v40;
  id v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  uint64_t v47;
  void *v48;
  void *v49;
  void *v50;
  double v51;
  double v52;
  double v53;
  double v54;
  uint64_t v55;
  uint64_t v56;
  VNVector *v57;
  double v58;
  double v59;
  double v60;
  double v61;
  double v62;
  double *v63;
  VNVector *v64;
  VNVector *v65;
  void *v66;
  void *v67;
  VNVector *v68;
  double v69;
  double v70;
  double v71;
  double v72;
  double v73;
  void *v74;
  void *v75;
  VNVector *v76;
  double v77;
  double v78;
  double v79;
  double v80;
  double v81;
  double v82;
  double v83;
  double v84;
  double v85;
  double v86;
  double v87;
  double v88;
  double v89;
  double v90;
  double v91;
  double v92;
  double v93;
  double v94;
  double v95;
  double v96;
  double v97;
  double v98;
  VNVector *v99;
  double v100;
  double v101;
  double v102;
  double v103;
  double v104;
  VNVector *v105;
  double v106;
  double v107;
  double **v108;
  _UNKNOWN **v109;
  void *v110;
  void *v111;
  void *v112;
  double v113;
  double v114;
  double v115;
  double v116;
  double v117;
  double v118;
  double v119;
  double v120;
  double v121;
  double v122;
  double v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  VNCircle *v127;
  void *v128;
  VNCircle *v129;
  VNPoint *v131;
  uint64_t v133;
  void *v134;
  void *v135;
  void *v136;
  void *v137;
  double v138;
  double v139;
  double v140;
  void *v141;
  void *v142;
  void *v143;
  void *v144;
  double v145;
  double v146;
  VNPoint *v147;
  VNVector *v148;
  double v149;
  double v150;
  double v151;
  uint64_t v152;
  uint64_t v153;
  VNVector *v154;
  VNVector *v155;
  void *v156;
  void *v157;
  double v158;
  VNVector *v159;
  void *v160;
  void *v161;
  void *v162;
  __int128 v163;
  __int128 v164;
  __int128 v165;

  objc_opt_self();
  objc_opt_self();
  v4 = a3[1];
  v5 = (char *)v4 - (char *)*a3;
  v6 = v5 >> 4;
  +[VNError VNAssert:log:](VNError, "VNAssert:log:", v4 != *a3, CFSTR("Number of points in collection must be greater than zero"));
  v7 = &off_1E4529000;
  if (v5 >> 4 == 2)
  {
    v11 = -[VNPoint initWithLocation:]([VNPoint alloc], "initWithLocation:", (*a3)[2], (*a3)[3]);
    v12 = -[VNVector initWithXComponent:yComponent:]([VNVector alloc], "initWithXComponent:yComponent:", **a3 - (*a3)[2], (*a3)[1] - (*a3)[3]);
    +[VNVector vectorByMultiplyingVector:byScalar:](VNVector, "vectorByMultiplyingVector:byScalar:", v12, 0.5);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    +[VNPoint pointByApplyingVector:toPoint:](VNPoint, "pointByApplyingVector:toPoint:", v13, v11);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v14, "location");
    v8 = v15;
    v9 = v16;
    -[VNVector length](v12, "length");
    v18 = v17;
    objc_opt_self();
    v10 = v18 * 0.5 + 0.00001;

LABEL_40:
    goto LABEL_41;
  }
  if (v6 != 1)
  {
    objc_opt_self();
    v11 = (VNPoint *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Number of points in collection must be greater or equal than %lu"), v5 >> 4);
    +[VNError VNAssert:log:](VNError, "VNAssert:log:", v6 <= ((char *)a3[1] - (char *)*a3) >> 4, v11);
    v133 = v5 >> 4;
    v131 = -[VNPoint initWithLocation:]([VNPoint alloc], "initWithLocation:", (*a3)[2], (*a3)[3]);
    v19 = off_1E452A000;
    v20 = -[VNVector initWithXComponent:yComponent:]([VNVector alloc], "initWithXComponent:yComponent:", **a3 - (*a3)[2], (*a3)[1] - (*a3)[3]);
    +[VNVector vectorByMultiplyingVector:byScalar:](VNVector, "vectorByMultiplyingVector:byScalar:", v20, 0.5);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    +[VNPoint pointByApplyingVector:toPoint:](VNPoint, "pointByApplyingVector:toPoint:", v21, v131);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    v137 = v22;
    objc_msgSend(v22, "location");
    v8 = v23;
    v9 = v24;
    -[VNVector length](v20, "length");
    v26 = v25;
    objc_opt_self();
    v10 = v26 * 0.5 + 0.00001;
    if ((unint64_t)v5 >= 0x21)
    {
      v152 = 2;
      v147 = v11;
      v148 = v20;
      do
      {
        v27 = objc_alloc(v19[45]);
        objc_msgSend(v137, "x");
        v29 = v28;
        v30 = (*a3)[2 * v152];
        objc_msgSend(v137, "y");
        v136 = (void *)objc_msgSend(v27, "initWithXComponent:yComponent:", v29 - v30, v31 - (*a3)[2 * v152 + 1]);
        objc_msgSend(v136, "length");
        if (v32 >= v10)
        {
          v135 = (void *)objc_msgSend(objc_alloc((Class)v7[501]), "initWithLocation:", **a3, (*a3)[1]);
          v33 = objc_msgSend(objc_alloc(v19[45]), "initWithXComponent:yComponent:", (*a3)[2 * v152] - **a3, (*a3)[2 * v152 + 1] - (*a3)[1]);
          v34 = v7[501];
          v134 = (void *)v33;
          -[__objc2_class vectorByMultiplyingVector:byScalar:](v19[45], "vectorByMultiplyingVector:byScalar:", 0.5);
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v34, "pointByApplyingVector:toPoint:", v35, v135);
          v36 = (void *)objc_claimAutoreleasedReturnValue();

          v144 = v36;
          objc_msgSend(v36, "location");
          v138 = v38;
          v139 = v37;
          objc_msgSend(v134, "length");
          v40 = v39;
          objc_opt_self();
          v140 = v40 * 0.5 + 0.00001;
          v153 = 1;
          v150 = v9;
          v151 = v8;
          v149 = v10;
          do
          {
            v41 = objc_alloc(v19[45]);
            objc_msgSend(v144, "x");
            v43 = v42;
            v44 = (*a3)[2 * v153];
            objc_msgSend(v144, "y");
            v143 = (void *)objc_msgSend(v41, "initWithXComponent:yComponent:", v43 - v44, v45 - (*a3)[2 * v153 + 1]);
            objc_msgSend(v143, "length");
            if (v46 >= v140)
            {
              v142 = (void *)objc_msgSend(objc_alloc((Class)v7[501]), "initWithLocation:", (*a3)[2 * v152], (*a3)[2 * v152 + 1]);
              v47 = objc_msgSend(objc_alloc(v19[45]), "initWithXComponent:yComponent:", (*a3)[2 * v153] - (*a3)[2 * v152], (*a3)[2 * v153 + 1] - (*a3)[2 * v152 + 1]);
              v48 = v7[501];
              v141 = (void *)v47;
              -[__objc2_class vectorByMultiplyingVector:byScalar:](v19[45], "vectorByMultiplyingVector:byScalar:", 0.5);
              v49 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v48, "pointByApplyingVector:toPoint:", v49, v142);
              v50 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend(v50, "location");
              v145 = v52;
              v146 = v51;
              objc_msgSend(v141, "length");
              v54 = v53;
              objc_opt_self();
              v55 = 0;
              v158 = v54 * 0.5 + 0.00001;
              v56 = v153;
              do
              {
                v57 = [VNVector alloc];
                objc_msgSend(v50, "x");
                v59 = v58;
                v60 = (*a3)[v55];
                objc_msgSend(v50, "y");
                v159 = -[VNVector initWithXComponent:yComponent:](v57, "initWithXComponent:yComponent:", v59 - v60, v61 - (*a3)[v55 + 1]);
                -[VNVector length](v159, "length");
                if (v62 >= v158)
                {
                  v163 = *(_OWORD *)&(*a3)[2 * v152];
                  v164 = *(_OWORD *)&(*a3)[2 * v153];
                  v165 = *(_OWORD *)&(*a3)[v55];
                  v63 = (double *)operator new(0x30uLL);
                  *(_OWORD *)v63 = v163;
                  *((_OWORD *)v63 + 1) = v164;
                  *((_OWORD *)v63 + 2) = v165;
                  objc_opt_self();
                  +[VNError VNAssert:log:](VNError, "VNAssert:log:", 1, CFSTR("A collection must contain 3 points"));
                  v162 = (void *)objc_msgSend(objc_alloc((Class)v7[501]), "initWithLocation:", *v63, v63[1]);
                  v157 = (void *)objc_msgSend(objc_alloc((Class)v7[501]), "initWithLocation:", v63[2], v63[3]);
                  v64 = -[VNVector initWithXComponent:yComponent:]([VNVector alloc], "initWithXComponent:yComponent:", v63[2] - *v63, v63[3] - v63[1]);
                  v156 = v50;
                  v65 = -[VNVector initWithXComponent:yComponent:]([VNVector alloc], "initWithXComponent:yComponent:", v63[4] - *v63, v63[5] - v63[1]);
                  v66 = v7[501];
                  +[VNVector vectorByMultiplyingVector:byScalar:](VNVector, "vectorByMultiplyingVector:byScalar:", v64, 0.5);
                  v67 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v66, "pointByApplyingVector:toPoint:", v67, v162);
                  v161 = (void *)objc_claimAutoreleasedReturnValue();

                  v68 = [VNVector alloc];
                  objc_msgSend(v161, "x");
                  v70 = v69;
                  objc_msgSend(v161, "y");
                  v155 = -[VNVector initWithXComponent:yComponent:](v68, "initWithXComponent:yComponent:", v70, v71);
                  +[VNVector dotProductOfVector:vector:](VNVector, "dotProductOfVector:vector:");
                  v73 = v72;
                  v74 = v7[501];
                  +[VNVector vectorByMultiplyingVector:byScalar:](VNVector, "vectorByMultiplyingVector:byScalar:", v65, 0.5);
                  v75 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v74, "pointByApplyingVector:toPoint:", v75, v162);
                  v160 = (void *)objc_claimAutoreleasedReturnValue();

                  v76 = [VNVector alloc];
                  objc_msgSend(v160, "x");
                  v78 = v77;
                  objc_msgSend(v160, "y");
                  v154 = -[VNVector initWithXComponent:yComponent:](v76, "initWithXComponent:yComponent:", v78, v79);
                  +[VNVector dotProductOfVector:vector:](VNVector, "dotProductOfVector:vector:");
                  v81 = v80;
                  -[VNVector x](v64, "x");
                  v83 = v82;
                  -[VNVector y](v65, "y");
                  v85 = v84;
                  -[VNVector y](v64, "y");
                  v87 = v86;
                  -[VNVector x](v65, "x");
                  v89 = v88;
                  objc_opt_self();
                  v90 = v83 * v85 - v87 * v89;
                  if (fabs(v90) <= 0.00001)
                  {
                    v105 = -[VNVector initWithXComponent:yComponent:]([VNVector alloc], "initWithXComponent:yComponent:", v63[4] - v63[2], v63[5] - v63[3]);
                    v108 = a3;
                    v109 = v7;
                    v110 = v7[501];
                    +[VNVector vectorByMultiplyingVector:byScalar:](VNVector, "vectorByMultiplyingVector:byScalar:", v105, 0.5);
                    v111 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v110, "pointByApplyingVector:toPoint:", v111, v157);
                    v112 = (void *)objc_claimAutoreleasedReturnValue();

                    -[VNVector length](v64, "length");
                    v114 = v113;
                    -[VNVector length](v65, "length");
                    v116 = v115;
                    -[VNVector length](v105, "length");
                    if (v116 >= v117)
                      v117 = v116;
                    if (v114 >= v117)
                      v118 = v114;
                    else
                      v118 = v117;
                    objc_opt_self();
                    if (v118 == v114)
                    {
                      objc_msgSend(v161, "location");
                      v102 = v119;
                      v103 = v120;
                      a3 = v108;
                    }
                    else
                    {
                      a3 = v108;
                      if (v118 == v116)
                        objc_msgSend(v160, "location");
                      else
                        objc_msgSend(v112, "location");
                      v102 = v121;
                      v103 = v122;
                    }
                    v107 = v118 * 0.5;

                    v7 = v109;
                  }
                  else
                  {
                    -[VNVector y](v65, "y");
                    v92 = v91;
                    -[VNVector y](v64, "y");
                    v94 = v93;
                    -[VNVector x](v64, "x");
                    v96 = v95;
                    -[VNVector x](v65, "x");
                    v98 = v97;
                    v99 = [VNVector alloc];
                    objc_msgSend(v162, "x");
                    v101 = v100;
                    objc_msgSend(v162, "y");
                    v102 = (v73 * v92 - v81 * v94) / v90;
                    v103 = (v96 * v81 - v98 * v73) / v90;
                    v105 = -[VNVector initWithXComponent:yComponent:](v99, "initWithXComponent:yComponent:", v102 - v101, v103 - v104);
                    -[VNVector length](v105, "length");
                    v107 = v106;
                    objc_opt_self();
                  }
                  v123 = v107 + 0.00001;

                  v11 = v147;
                  if (v123 <= 0.0)
                  {
                    v50 = v156;
                  }
                  else
                  {
                    v124 = objc_msgSend(objc_alloc((Class)v7[501]), "initWithLocation:", v102, v103);

                    v50 = (void *)v124;
                    v158 = v123;
                    v145 = v103;
                    v146 = v102;
                  }
                  operator delete(v63);
                  v20 = v148;
                  v9 = v150;
                  v8 = v151;
                  v10 = v149;
                }

                v55 += 2;
                --v56;
              }
              while (v56);
              v19 = off_1E452A000;
              if (v158 > 0.0)
              {
                v125 = objc_msgSend(objc_alloc((Class)v7[501]), "initWithLocation:", v146, v145);

                v144 = (void *)v125;
                v139 = v146;
                v140 = v158;
                v138 = v145;
              }

            }
            ++v153;
          }
          while (v153 != v152);
          if (v140 > 0.0)
          {
            v126 = objc_msgSend(objc_alloc((Class)v7[501]), "initWithLocation:", v139, v138);

            v137 = (void *)v126;
            v8 = v139;
            v10 = v140;
            v9 = v138;
          }

        }
        ++v152;
      }
      while (v152 != v133);
    }

    goto LABEL_40;
  }
  v8 = **a3;
  v9 = (*a3)[1];
  objc_opt_self();
  v10 = 0.00001;
LABEL_41:
  v127 = [VNCircle alloc];
  v128 = (void *)objc_msgSend(objc_alloc((Class)v7[501]), "initWithLocation:", v8, v9 * a1);
  v129 = -[VNCircle initWithCenter:radius:](v127, "initWithCenter:radius:", v128, v10);

  return v129;
}

@end
