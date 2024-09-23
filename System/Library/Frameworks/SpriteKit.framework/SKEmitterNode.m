@implementation SKEmitterNode

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)_makeBackingNode
{
  SKCEmitterNode *v2;

  v2 = (SKCEmitterNode *)operator new();
  SKCEmitterNode::SKCEmitterNode(v2);
  return v2;
}

- (void)_didMakeBackingNode
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SKEmitterNode;
  -[SKNode _didMakeBackingNode](&v3, sel__didMakeBackingNode);
  self->_skcEmitterNode = -[SKNode _backingNode](self, "_backingNode");
}

- (id)subEmitterNode
{
  SKCEmitterNode **v3;

  +[SKNode node](SKEmitterNode, "node");
  v3 = (SKCEmitterNode **)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[SKEmitterNode copyParticlePropertiesToNode:](self, "copyParticlePropertiesToNode:", v3);
    SKCEmitterNode::addSubEmitterNode((uint64_t *)self->_skcEmitterNode, v3[19]);
  }
  return v3;
}

- (id)fieldInfluenceSequence
{
  return self->_fieldInfluenceSequence;
}

- (void)setFieldInfluenceSequence:(id)a3
{
  SKKeyframeSequence *v4;
  SKCKeyframeSequence *v5;
  uint64_t v6;
  SKCKeyframeSequence *v7;
  uint64_t i;
  double v9;
  double v10;
  void *v11;
  float v12;
  float v13;
  SKKeyframeSequence *fieldInfluenceSequence;
  float v15;

  v4 = (SKKeyframeSequence *)a3;
  v5 = (SKCKeyframeSequence *)*((_QWORD *)self->_skcEmitterNode + 83);
  if (v5)
  {
    SKCKeyframeSequence::~SKCKeyframeSequence(v5);
    MEMORY[0x1DF0CF560]();
    *((_QWORD *)self->_skcEmitterNode + 83) = 0;
  }
  if (v4)
  {
    v6 = -[SKKeyframeSequence count](v4, "count");
    v7 = (SKCKeyframeSequence *)operator new();
    SKCKeyframeSequence::SKCKeyframeSequence(v7, v6, 1);
    SKCKeyframeSequence::setInterpMode(v7, -[SKKeyframeSequence interpolationMode](v4, "interpolationMode"));
    SKCKeyframeSequence::setRepeatMode(v7, -[SKKeyframeSequence repeatMode](v4, "repeatMode"));
    if (v6)
    {
      for (i = 0; i != v6; ++i)
      {
        -[SKKeyframeSequence getKeyframeTimeForIndex:](v4, "getKeyframeTimeForIndex:", i);
        v10 = v9;
        v15 = 0.0;
        -[SKKeyframeSequence getKeyframeValueForIndex:](v4, "getKeyframeValueForIndex:", i);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "floatValue");
        v13 = v12;

        v15 = v13;
        *(float *)&v10 = v10;
        SKCKeyframeSequence::setKeyframe(v7, i, *(float *)&v10, &v15);
      }
    }
    *((_QWORD *)self->_skcEmitterNode + 83) = v7;
  }
  fieldInfluenceSequence = self->_fieldInfluenceSequence;
  self->_fieldInfluenceSequence = v4;

}

- (id)particleSpeedSequence
{
  return self->_particleSpeedSequence;
}

- (void)setParticleSpeedSequence:(id)a3
{
  SKKeyframeSequence *v4;
  SKCKeyframeSequence *v5;
  uint64_t v6;
  SKCKeyframeSequence *v7;
  uint64_t i;
  double v9;
  double v10;
  void *v11;
  float v12;
  float v13;
  SKKeyframeSequence *particleSpeedSequence;
  float v15;

  v4 = (SKKeyframeSequence *)a3;
  v5 = (SKCKeyframeSequence *)*((_QWORD *)self->_skcEmitterNode + 84);
  if (v5)
  {
    SKCKeyframeSequence::~SKCKeyframeSequence(v5);
    MEMORY[0x1DF0CF560]();
    *((_QWORD *)self->_skcEmitterNode + 84) = 0;
  }
  if (v4)
  {
    v6 = -[SKKeyframeSequence count](v4, "count");
    v7 = (SKCKeyframeSequence *)operator new();
    SKCKeyframeSequence::SKCKeyframeSequence(v7, v6, 1);
    SKCKeyframeSequence::setInterpMode(v7, -[SKKeyframeSequence interpolationMode](v4, "interpolationMode"));
    SKCKeyframeSequence::setRepeatMode(v7, -[SKKeyframeSequence repeatMode](v4, "repeatMode"));
    if (v6)
    {
      for (i = 0; i != v6; ++i)
      {
        -[SKKeyframeSequence getKeyframeTimeForIndex:](v4, "getKeyframeTimeForIndex:", i);
        v10 = v9;
        v15 = 0.0;
        -[SKKeyframeSequence getKeyframeValueForIndex:](v4, "getKeyframeValueForIndex:", i);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "floatValue");
        v13 = v12;

        v15 = v13;
        *(float *)&v10 = v10;
        SKCKeyframeSequence::setKeyframe(v7, i, *(float *)&v10, &v15);
      }
    }
    *((_QWORD *)self->_skcEmitterNode + 84) = v7;
  }
  particleSpeedSequence = self->_particleSpeedSequence;
  self->_particleSpeedSequence = v4;

}

- (BOOL)isEqualToNode:(id)a3
{
  SKEmitterNode *v4;
  SKEmitterNode *v5;
  float *skcEmitterNode;
  double v7;
  double v8;
  float v9;
  double v10;
  NSUInteger v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  float v16;
  double v17;
  double v18;
  double v19;
  float v20;
  double v21;
  BOOL v22;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  float v32;
  double v33;
  double v34;
  double v35;
  float v36;
  double v37;
  double v38;
  double v39;
  float v40;
  double v41;
  double v42;
  double v43;
  float v44;
  double v45;
  double v46;
  double v47;
  float v48;
  double v49;
  double v50;
  double v51;
  float v52;
  double v53;
  double v54;
  double v55;
  float v56;
  double v57;
  double v58;
  double v59;
  float v60;
  double v61;
  double v62;
  double v63;
  float v64;
  double v65;
  double v66;
  double v67;
  float v68;
  double v69;
  double v70;
  double v71;
  float v72;
  double v73;
  double v74;
  double v75;
  float v76;
  double v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  double v82;
  double v83;
  float v84;
  double v85;
  double v86;
  double v87;
  float v88;
  double v89;
  uint64_t v90;
  uint64_t v91;
  double v92;
  double v93;
  float v94;
  double v95;
  double v96;
  double v97;
  float v98;
  double v99;
  double v100;
  double v101;
  float v102;
  double v103;
  double v104;
  double v105;
  float v106;
  double v107;
  double v108;
  double v109;
  float v110;
  double v111;
  double v112;
  double v113;
  float v114;
  double v115;
  double v116;
  double v117;
  float v118;
  double v119;
  double v120;
  double v121;
  float v122;
  double v123;
  uint64_t v124;
  double v125;
  double v126;
  float v127;
  double v128;
  double v129;
  double v130;
  float v131;
  double v132;
  double v133;
  double v134;
  float v135;
  double v136;
  SKBlendMode v137;
  uint64_t v138;
  double v139;
  double v140;
  float v141;
  double v142;
  double v143;
  double v144;
  float v145;
  double v146;
  double v147;
  double v148;
  float v149;
  double v150;
  uint64_t v151;
  void *v152;
  void *v153;
  void *v154;
  void *v155;
  void *v156;
  void *v157;
  void *v158;
  void *v159;
  void *v160;
  void *v161;
  objc_super v162;

  v4 = (SKEmitterNode *)a3;
  if (self == v4)
  {
    v22 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      skcEmitterNode = (float *)v5->_skcEmitterNode;
      v162.receiver = self;
      v162.super_class = (Class)SKEmitterNode;
      if (!-[SKNode isEqualToNode:](&v162, sel_isEqualToNode_, v5)
        || (-[SKEmitterNode particleBirthRate](self, "particleBirthRate"),
            v8 = v7,
            -[SKEmitterNode particleBirthRate](v5, "particleBirthRate"),
            v9 = v8,
            *(float *)&v10 = v10,
            (COERCE_UNSIGNED_INT(v9 - *(float *)&v10) & 0x60000000) != 0)
        || (v11 = -[SKEmitterNode numParticlesToEmit](self, "numParticlesToEmit"),
            v11 != -[SKEmitterNode numParticlesToEmit](v5, "numParticlesToEmit")))
      {
        v22 = 0;
        goto LABEL_14;
      }
      -[SKEmitterNode targetNode](self, "targetNode");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[SKEmitterNode targetNode](v5, "targetNode");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (v12 == v13)
      {
        -[SKEmitterNode particleLifetime](self, "particleLifetime");
        v15 = v14;
        -[SKEmitterNode particleLifetime](v5, "particleLifetime");
        v16 = v15;
        *(float *)&v17 = v17;
        if ((COERCE_UNSIGNED_INT(v16 - *(float *)&v17) & 0x60000000) == 0)
        {
          -[SKEmitterNode particleLifetimeRange](self, "particleLifetimeRange");
          v19 = v18;
          -[SKEmitterNode particleLifetimeRange](v5, "particleLifetimeRange");
          v20 = v19;
          *(float *)&v21 = v21;
          if ((COERCE_UNSIGNED_INT(v20 - *(float *)&v21) & 0x60000000) == 0)
          {
            -[SKEmitterNode particlePosition](self, "particlePosition");
            v25 = v24;
            v27 = v26;
            -[SKEmitterNode particlePosition](v5, "particlePosition");
            v22 = 0;
            if (v25 != v29 || v27 != v28)
              goto LABEL_10;
            -[SKEmitterNode particlePositionRange](self, "particlePositionRange");
            v31 = v30;
            -[SKEmitterNode particlePositionRange](v5, "particlePositionRange");
            v32 = v31;
            *(float *)&v33 = v33;
            if ((COERCE_UNSIGNED_INT(v32 - *(float *)&v33) & 0x60000000) == 0)
            {
              -[SKEmitterNode particlePositionRange](self, "particlePositionRange");
              v35 = v34;
              -[SKEmitterNode particlePositionRange](v5, "particlePositionRange");
              v36 = v35;
              *(float *)&v37 = v37;
              if ((COERCE_UNSIGNED_INT(v36 - *(float *)&v37) & 0x60000000) == 0)
              {
                -[SKEmitterNode particleZPosition](self, "particleZPosition");
                v39 = v38;
                -[SKEmitterNode particleZPosition](v5, "particleZPosition");
                v40 = v39;
                *(float *)&v41 = v41;
                if ((COERCE_UNSIGNED_INT(v40 - *(float *)&v41) & 0x60000000) == 0
                  && (COERCE_UNSIGNED_INT(*((float *)self->_skcEmitterNode + 189) - skcEmitterNode[189]) & 0x60000000) == 0)
                {
                  -[SKEmitterNode particleSpeed](self, "particleSpeed");
                  v43 = v42;
                  -[SKEmitterNode particleSpeed](v5, "particleSpeed");
                  v44 = v43;
                  *(float *)&v45 = v45;
                  if ((COERCE_UNSIGNED_INT(v44 - *(float *)&v45) & 0x60000000) == 0)
                  {
                    -[SKEmitterNode particleSpeedRange](self, "particleSpeedRange");
                    v47 = v46;
                    -[SKEmitterNode particleSpeedRange](v5, "particleSpeedRange");
                    v48 = v47;
                    *(float *)&v49 = v49;
                    if ((COERCE_UNSIGNED_INT(v48 - *(float *)&v49) & 0x60000000) == 0)
                    {
                      -[SKEmitterNode emissionAngle](self, "emissionAngle");
                      v51 = v50;
                      -[SKEmitterNode emissionAngle](v5, "emissionAngle");
                      v52 = v51;
                      *(float *)&v53 = v53;
                      if ((COERCE_UNSIGNED_INT(v52 - *(float *)&v53) & 0x60000000) == 0)
                      {
                        -[SKEmitterNode emissionAngleRange](self, "emissionAngleRange");
                        v55 = v54;
                        -[SKEmitterNode emissionAngleRange](v5, "emissionAngleRange");
                        v56 = v55;
                        *(float *)&v57 = v57;
                        if ((COERCE_UNSIGNED_INT(v56 - *(float *)&v57) & 0x60000000) == 0)
                        {
                          -[SKEmitterNode xAcceleration](self, "xAcceleration");
                          v59 = v58;
                          -[SKEmitterNode xAcceleration](v5, "xAcceleration");
                          v60 = v59;
                          *(float *)&v61 = v61;
                          if ((COERCE_UNSIGNED_INT(v60 - *(float *)&v61) & 0x60000000) == 0)
                          {
                            -[SKEmitterNode yAcceleration](self, "yAcceleration");
                            v63 = v62;
                            -[SKEmitterNode yAcceleration](v5, "yAcceleration");
                            v64 = v63;
                            *(float *)&v65 = v65;
                            if ((COERCE_UNSIGNED_INT(v64 - *(float *)&v65) & 0x60000000) == 0)
                            {
                              -[SKEmitterNode particleRotation](self, "particleRotation");
                              v67 = v66;
                              -[SKEmitterNode particleRotation](v5, "particleRotation");
                              v68 = v67;
                              *(float *)&v69 = v69;
                              if ((COERCE_UNSIGNED_INT(v68 - *(float *)&v69) & 0x60000000) == 0)
                              {
                                -[SKEmitterNode particleRotationRange](self, "particleRotationRange");
                                v71 = v70;
                                -[SKEmitterNode particleRotationRange](v5, "particleRotationRange");
                                v72 = v71;
                                *(float *)&v73 = v73;
                                if ((COERCE_UNSIGNED_INT(v72 - *(float *)&v73) & 0x60000000) == 0)
                                {
                                  -[SKEmitterNode particleRotationSpeed](self, "particleRotationSpeed");
                                  v75 = v74;
                                  -[SKEmitterNode particleRotationSpeed](v5, "particleRotationSpeed");
                                  v76 = v75;
                                  *(float *)&v77 = v77;
                                  if ((COERCE_UNSIGNED_INT(v76 - *(float *)&v77) & 0x60000000) == 0)
                                  {
                                    -[SKEmitterNode particleTexture](self, "particleTexture");
                                    v78 = (void *)objc_claimAutoreleasedReturnValue();
                                    objc_msgSend(v78, "imageNameOrPath");
                                    v79 = (void *)objc_claimAutoreleasedReturnValue();
                                    -[SKEmitterNode particleTexture](v5, "particleTexture");
                                    v80 = (void *)objc_claimAutoreleasedReturnValue();
                                    objc_msgSend(v80, "imageNameOrPath");
                                    v81 = (void *)objc_claimAutoreleasedReturnValue();
                                    if (!objc_msgSend(v79, "isEqualToString:", v81))
                                      goto LABEL_34;
                                    -[SKEmitterNode particleSize](self, "particleSize");
                                    v83 = v82;
                                    -[SKEmitterNode particleSize](v5, "particleSize");
                                    v84 = v83;
                                    *(float *)&v85 = v85;
                                    if ((COERCE_UNSIGNED_INT(v84 - *(float *)&v85) & 0x60000000) != 0
                                      || (-[SKEmitterNode particleSize](self, "particleSize"),
                                          v87 = v86,
                                          -[SKEmitterNode particleSize](v5, "particleSize"),
                                          v88 = v87,
                                          *(float *)&v89 = v89,
                                          (COERCE_UNSIGNED_INT(v88 - *(float *)&v89) & 0x60000000) != 0))
                                    {
LABEL_34:
                                      v22 = 0;
                                    }
                                    else
                                    {
                                      -[SKEmitterNode particleColorSequence](self, "particleColorSequence");
                                      v161 = (void *)objc_claimAutoreleasedReturnValue();
                                      v90 = objc_msgSend(v161, "hash");
                                      -[SKEmitterNode particleColorSequence](v5, "particleColorSequence");
                                      v160 = (void *)objc_claimAutoreleasedReturnValue();
                                      if (v90 == objc_msgSend(v160, "hash"))
                                      {
                                        -[SKEmitterNode particleColor](self, "particleColor");
                                        v159 = (void *)objc_claimAutoreleasedReturnValue();
                                        v91 = objc_msgSend(v159, "hash");
                                        -[SKEmitterNode particleColor](v5, "particleColor");
                                        v158 = (void *)objc_claimAutoreleasedReturnValue();
                                        if (v91 != objc_msgSend(v158, "hash"))
                                          goto LABEL_46;
                                        -[SKEmitterNode particleColorAlphaRange](self, "particleColorAlphaRange");
                                        v93 = v92;
                                        -[SKEmitterNode particleColorAlphaRange](v5, "particleColorAlphaRange");
                                        v94 = v93;
                                        *(float *)&v95 = v95;
                                        if ((COERCE_UNSIGNED_INT(v94 - *(float *)&v95) & 0x60000000) != 0)
                                          goto LABEL_46;
                                        -[SKEmitterNode particleColorBlueRange](self, "particleColorBlueRange");
                                        v97 = v96;
                                        -[SKEmitterNode particleColorBlueRange](v5, "particleColorBlueRange");
                                        v98 = v97;
                                        *(float *)&v99 = v99;
                                        if ((COERCE_UNSIGNED_INT(v98 - *(float *)&v99) & 0x60000000) != 0)
                                          goto LABEL_46;
                                        -[SKEmitterNode particleColorGreenRange](self, "particleColorGreenRange");
                                        v101 = v100;
                                        -[SKEmitterNode particleColorGreenRange](v5, "particleColorGreenRange");
                                        v102 = v101;
                                        *(float *)&v103 = v103;
                                        if ((COERCE_UNSIGNED_INT(v102 - *(float *)&v103) & 0x60000000) != 0)
                                          goto LABEL_46;
                                        -[SKEmitterNode particleColorRedRange](self, "particleColorRedRange");
                                        v105 = v104;
                                        -[SKEmitterNode particleColorRedRange](v5, "particleColorRedRange");
                                        v106 = v105;
                                        *(float *)&v107 = v107;
                                        if ((COERCE_UNSIGNED_INT(v106 - *(float *)&v107) & 0x60000000) != 0)
                                          goto LABEL_46;
                                        -[SKEmitterNode particleColorAlphaSpeed](self, "particleColorAlphaSpeed");
                                        v109 = v108;
                                        -[SKEmitterNode particleColorAlphaSpeed](v5, "particleColorAlphaSpeed");
                                        v110 = v109;
                                        *(float *)&v111 = v111;
                                        if ((COERCE_UNSIGNED_INT(v110 - *(float *)&v111) & 0x60000000) != 0)
                                          goto LABEL_46;
                                        -[SKEmitterNode particleColorBlueSpeed](self, "particleColorBlueSpeed");
                                        v113 = v112;
                                        -[SKEmitterNode particleColorBlueSpeed](v5, "particleColorBlueSpeed");
                                        v114 = v113;
                                        *(float *)&v115 = v115;
                                        if ((COERCE_UNSIGNED_INT(v114 - *(float *)&v115) & 0x60000000) != 0)
                                          goto LABEL_46;
                                        -[SKEmitterNode particleColorGreenSpeed](self, "particleColorGreenSpeed");
                                        v117 = v116;
                                        -[SKEmitterNode particleColorGreenSpeed](v5, "particleColorGreenSpeed");
                                        v118 = v117;
                                        *(float *)&v119 = v119;
                                        if ((COERCE_UNSIGNED_INT(v118 - *(float *)&v119) & 0x60000000) != 0
                                          || (-[SKEmitterNode particleColorRedSpeed](self, "particleColorRedSpeed"),
                                              v121 = v120,
                                              -[SKEmitterNode particleColorRedSpeed](v5, "particleColorRedSpeed"),
                                              v122 = v121,
                                              *(float *)&v123 = v123,
                                              (COERCE_UNSIGNED_INT(v122 - *(float *)&v123) & 0x60000000) != 0))
                                        {
LABEL_46:
                                          v22 = 0;
                                        }
                                        else
                                        {
                                          -[SKEmitterNode particleColorBlendFactorSequence](self, "particleColorBlendFactorSequence");
                                          v157 = (void *)objc_claimAutoreleasedReturnValue();
                                          v124 = objc_msgSend(v157, "hash");
                                          -[SKEmitterNode particleColorBlendFactorSequence](v5, "particleColorBlendFactorSequence");
                                          v156 = (void *)objc_claimAutoreleasedReturnValue();
                                          if (v124 != objc_msgSend(v156, "hash"))
                                            goto LABEL_61;
                                          -[SKEmitterNode particleColorBlendFactor](self, "particleColorBlendFactor");
                                          v126 = v125;
                                          -[SKEmitterNode particleColorBlendFactor](v5, "particleColorBlendFactor");
                                          v127 = v126;
                                          *(float *)&v128 = v128;
                                          if ((COERCE_UNSIGNED_INT(v127 - *(float *)&v128) & 0x60000000) != 0)
                                            goto LABEL_61;
                                          -[SKEmitterNode particleColorBlendFactorRange](self, "particleColorBlendFactorRange");
                                          v130 = v129;
                                          -[SKEmitterNode particleColorBlendFactorRange](v5, "particleColorBlendFactorRange");
                                          v131 = v130;
                                          *(float *)&v132 = v132;
                                          if ((COERCE_UNSIGNED_INT(v131 - *(float *)&v132) & 0x60000000) != 0
                                            || (-[SKEmitterNode particleColorBlendFactorSpeed](self, "particleColorBlendFactorSpeed"), v134 = v133, -[SKEmitterNode particleColorBlendFactorSpeed](v5, "particleColorBlendFactorSpeed"), v135 = v134, *(float *)&v136 = v136, (COERCE_UNSIGNED_INT(v135 - *(float *)&v136) & 0x60000000) != 0)|| (v137 = -[SKEmitterNode particleBlendMode](self, "particleBlendMode"), v137 != -[SKEmitterNode particleBlendMode](v5, "particleBlendMode")))
                                          {
LABEL_61:
                                            v22 = 0;
                                          }
                                          else
                                          {
                                            -[SKEmitterNode particleAlphaSequence](self, "particleAlphaSequence");
                                            v155 = (void *)objc_claimAutoreleasedReturnValue();
                                            v138 = objc_msgSend(v155, "hash");
                                            -[SKEmitterNode particleAlphaSequence](v5, "particleAlphaSequence");
                                            v154 = (void *)objc_claimAutoreleasedReturnValue();
                                            if (v138 != objc_msgSend(v154, "hash"))
                                              goto LABEL_59;
                                            -[SKEmitterNode particleAlpha](self, "particleAlpha");
                                            v140 = v139;
                                            -[SKEmitterNode particleAlpha](v5, "particleAlpha");
                                            v141 = v140;
                                            *(float *)&v142 = v142;
                                            if ((COERCE_UNSIGNED_INT(v141 - *(float *)&v142) & 0x60000000) != 0)
                                              goto LABEL_59;
                                            -[SKEmitterNode particleAlphaRange](self, "particleAlphaRange");
                                            v144 = v143;
                                            -[SKEmitterNode particleAlphaRange](v5, "particleAlphaRange");
                                            v145 = v144;
                                            *(float *)&v146 = v146;
                                            if ((COERCE_UNSIGNED_INT(v145 - *(float *)&v146) & 0x60000000) != 0
                                              || (-[SKEmitterNode particleAlphaSpeed](self, "particleAlphaSpeed"),
                                                  v148 = v147,
                                                  -[SKEmitterNode particleAlphaSpeed](v5, "particleAlphaSpeed"),
                                                  v149 = v148,
                                                  *(float *)&v150 = v150,
                                                  (COERCE_UNSIGNED_INT(v149 - *(float *)&v150) & 0x60000000) != 0))
                                            {
LABEL_59:
                                              v22 = 0;
                                            }
                                            else
                                            {
                                              -[SKEmitterNode particleSpeedSequence](self, "particleSpeedSequence");
                                              v153 = (void *)objc_claimAutoreleasedReturnValue();
                                              v151 = objc_msgSend(v153, "hash");
                                              -[SKEmitterNode particleSpeedSequence](v5, "particleSpeedSequence");
                                              v152 = (void *)objc_claimAutoreleasedReturnValue();
                                              v22 = v151 == objc_msgSend(v152, "hash");

                                            }
                                          }

                                        }
                                      }
                                      else
                                      {
                                        v22 = 0;
                                      }

                                    }
                                    goto LABEL_10;
                                  }
                                }
                              }
                            }
                          }
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
      v22 = 0;
LABEL_10:

LABEL_14:
      goto LABEL_15;
    }
    v22 = 0;
  }
LABEL_15:

  return v22;
}

- (id)physicsWorld
{
  return 0;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  CGPoint v10;
  CGRect v11;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[SKNode name](self, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKEmitterNode particleTexture](self, "particleTexture");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKNode position](self, "position");
  NSStringFromCGPoint(v10);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKNode calculateAccumulatedFrame](self, "calculateAccumulatedFrame");
  NSStringFromCGRect(v11);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<SKEmitterNode> name:'%@' particleTexture:%@ position:%@ accumulatedFrame:%@"), v4, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (void)setTargetNode:(SKNode *)targetNode
{
  SKNode **p_target;
  id v5;
  SKCEmitterNode *skcEmitterNode;
  id v7;
  SKNode *v8;

  p_target = &self->_target;
  v8 = targetNode;
  v5 = objc_storeWeak((id *)p_target, v8);
  skcEmitterNode = (SKCEmitterNode *)self->_skcEmitterNode;
  v7 = v5;
  SKCEmitterNode::setTargetNode(skcEmitterNode, v8);

}

- (void)setParticleAlphaSequence:(SKKeyframeSequence *)particleAlphaSequence
{
  SKKeyframeSequence *v4;
  SKCKeyframeSequence *v5;
  uint64_t v6;
  SKCKeyframeSequence *v7;
  uint64_t i;
  double v9;
  double v10;
  void *v11;
  float v12;
  float v13;
  SKKeyframeSequence *alphaSequence;
  float v15;

  v4 = particleAlphaSequence;
  v5 = (SKCKeyframeSequence *)*((_QWORD *)self->_skcEmitterNode + 80);
  if (v5)
  {
    SKCKeyframeSequence::~SKCKeyframeSequence(v5);
    MEMORY[0x1DF0CF560]();
    *((_QWORD *)self->_skcEmitterNode + 80) = 0;
  }
  if (v4)
  {
    v6 = -[SKKeyframeSequence count](v4, "count");
    v7 = (SKCKeyframeSequence *)operator new();
    SKCKeyframeSequence::SKCKeyframeSequence(v7, v6, 1);
    SKCKeyframeSequence::setInterpMode(v7, -[SKKeyframeSequence interpolationMode](v4, "interpolationMode"));
    SKCKeyframeSequence::setRepeatMode(v7, -[SKKeyframeSequence repeatMode](v4, "repeatMode"));
    if (v6)
    {
      for (i = 0; i != v6; ++i)
      {
        -[SKKeyframeSequence getKeyframeTimeForIndex:](v4, "getKeyframeTimeForIndex:", i);
        v10 = v9;
        v15 = 0.0;
        -[SKKeyframeSequence getKeyframeValueForIndex:](v4, "getKeyframeValueForIndex:", i);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "floatValue");
        v13 = v12;

        v15 = v13;
        *(float *)&v10 = v10;
        SKCKeyframeSequence::setKeyframe(v7, i, *(float *)&v10, &v15);
      }
    }
    *((_QWORD *)self->_skcEmitterNode + 80) = v7;
  }
  alphaSequence = self->_alphaSequence;
  self->_alphaSequence = v4;

}

- (SKKeyframeSequence)particleAlphaSequence
{
  return self->_alphaSequence;
}

- (void)setParticleColorBlendFactorSequence:(SKKeyframeSequence *)particleColorBlendFactorSequence
{
  SKKeyframeSequence *v4;
  SKCKeyframeSequence *v5;
  uint64_t v6;
  SKCKeyframeSequence *v7;
  uint64_t i;
  double v9;
  double v10;
  void *v11;
  float v12;
  float v13;
  void *skcEmitterNode;
  SKCKeyframeSequence *v15;
  SKKeyframeSequence *colorBlendSequence;
  float v17;

  v4 = particleColorBlendFactorSequence;
  v5 = (SKCKeyframeSequence *)*((_QWORD *)self->_skcEmitterNode + 79);
  if (v5)
  {
    SKCKeyframeSequence::~SKCKeyframeSequence(v5);
    MEMORY[0x1DF0CF560]();
    *((_QWORD *)self->_skcEmitterNode + 79) = 0;
  }
  if (v4)
  {
    v6 = -[SKKeyframeSequence count](v4, "count");
    v7 = (SKCKeyframeSequence *)operator new();
    SKCKeyframeSequence::SKCKeyframeSequence(v7, v6, 1);
    SKCKeyframeSequence::setInterpMode(v7, -[SKKeyframeSequence interpolationMode](v4, "interpolationMode"));
    SKCKeyframeSequence::setRepeatMode(v7, -[SKKeyframeSequence repeatMode](v4, "repeatMode"));
    if (v6)
    {
      for (i = 0; i != v6; ++i)
      {
        -[SKKeyframeSequence getKeyframeTimeForIndex:](v4, "getKeyframeTimeForIndex:", i);
        v10 = v9;
        v17 = 0.0;
        -[SKKeyframeSequence getKeyframeValueForIndex:](v4, "getKeyframeValueForIndex:", i);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "floatValue");
        v13 = v12;

        v17 = v13;
        *(float *)&v10 = v10;
        SKCKeyframeSequence::setKeyframe(v7, i, *(float *)&v10, &v17);
      }
    }
    skcEmitterNode = self->_skcEmitterNode;
    v15 = (SKCKeyframeSequence *)*((_QWORD *)skcEmitterNode + 79);
    if (v15)
    {
      SKCKeyframeSequence::~SKCKeyframeSequence(v15);
      MEMORY[0x1DF0CF560]();
      skcEmitterNode = self->_skcEmitterNode;
    }
    *((_QWORD *)skcEmitterNode + 79) = v7;
  }
  colorBlendSequence = self->_colorBlendSequence;
  self->_colorBlendSequence = v4;

}

- (SKKeyframeSequence)particleColorBlendFactorSequence
{
  return self->_colorBlendSequence;
}

- (void)setParticleColorSequence:(SKKeyframeSequence *)particleColorSequence
{
  SKKeyframeSequence *v4;
  SKCKeyframeSequence *v5;
  uint64_t v6;
  SKCKeyframeSequence *v7;
  uint64_t i;
  double v9;
  double v10;
  void *v11;
  float v12;
  float v13;
  float v14;
  float v15;
  float v16;
  void *skcEmitterNode;
  SKCKeyframeSequence *v18;
  SKKeyframeSequence *colorSequence;
  float v20[4];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = particleColorSequence;
  v5 = (SKCKeyframeSequence *)*((_QWORD *)self->_skcEmitterNode + 78);
  if (v5)
  {
    SKCKeyframeSequence::~SKCKeyframeSequence(v5);
    MEMORY[0x1DF0CF560]();
    *((_QWORD *)self->_skcEmitterNode + 78) = 0;
  }
  if (v4)
  {
    v6 = -[SKKeyframeSequence count](v4, "count");
    v7 = (SKCKeyframeSequence *)operator new();
    SKCKeyframeSequence::SKCKeyframeSequence(v7, v6, 4);
    SKCKeyframeSequence::setInterpMode(v7, -[SKKeyframeSequence interpolationMode](v4, "interpolationMode"));
    SKCKeyframeSequence::setRepeatMode(v7, -[SKKeyframeSequence repeatMode](v4, "repeatMode"));
    if (v6)
    {
      for (i = 0; i != v6; ++i)
      {
        -[SKKeyframeSequence getKeyframeTimeForIndex:](v4, "getKeyframeTimeForIndex:", i);
        v10 = v9;
        -[SKKeyframeSequence getKeyframeValueForIndex:](v4, "getKeyframeValueForIndex:", i);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "componentRGBA");
        v12 = v10;
        v20[0] = v13;
        v20[1] = v14;
        v20[2] = v15;
        v20[3] = v16;
        SKCKeyframeSequence::setKeyframe(v7, i, v12, v20);

      }
    }
    skcEmitterNode = self->_skcEmitterNode;
    v18 = (SKCKeyframeSequence *)*((_QWORD *)skcEmitterNode + 78);
    if (v18)
    {
      SKCKeyframeSequence::~SKCKeyframeSequence(v18);
      MEMORY[0x1DF0CF560]();
      skcEmitterNode = self->_skcEmitterNode;
    }
    *((_QWORD *)skcEmitterNode + 78) = v7;
  }
  colorSequence = self->_colorSequence;
  self->_colorSequence = v4;

}

- (SKKeyframeSequence)particleColorSequence
{
  return self->_colorSequence;
}

- (void)setParticleScaleSequence:(SKKeyframeSequence *)particleScaleSequence
{
  SKKeyframeSequence *v4;
  SKCKeyframeSequence *v5;
  uint64_t v6;
  SKCKeyframeSequence *v7;
  uint64_t i;
  double v9;
  double v10;
  void *v11;
  float v12;
  float v13;
  void *skcEmitterNode;
  SKCKeyframeSequence *v15;
  SKKeyframeSequence *scaleSequence;
  float v17;

  v4 = particleScaleSequence;
  v5 = (SKCKeyframeSequence *)*((_QWORD *)self->_skcEmitterNode + 82);
  if (v5)
  {
    SKCKeyframeSequence::~SKCKeyframeSequence(v5);
    MEMORY[0x1DF0CF560]();
    *((_QWORD *)self->_skcEmitterNode + 82) = 0;
  }
  if (v4)
  {
    v6 = -[SKKeyframeSequence count](v4, "count");
    v7 = (SKCKeyframeSequence *)operator new();
    SKCKeyframeSequence::SKCKeyframeSequence(v7, v6, 1);
    SKCKeyframeSequence::setInterpMode(v7, -[SKKeyframeSequence interpolationMode](v4, "interpolationMode"));
    SKCKeyframeSequence::setRepeatMode(v7, -[SKKeyframeSequence repeatMode](v4, "repeatMode"));
    if (v6)
    {
      for (i = 0; i != v6; ++i)
      {
        -[SKKeyframeSequence getKeyframeTimeForIndex:](v4, "getKeyframeTimeForIndex:", i);
        v10 = v9;
        v17 = 0.0;
        -[SKKeyframeSequence getKeyframeValueForIndex:](v4, "getKeyframeValueForIndex:", i);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "floatValue");
        v13 = v12;

        v17 = v13;
        *(float *)&v10 = v10;
        SKCKeyframeSequence::setKeyframe(v7, i, *(float *)&v10, &v17);
      }
    }
    skcEmitterNode = self->_skcEmitterNode;
    v15 = (SKCKeyframeSequence *)*((_QWORD *)skcEmitterNode + 82);
    if (v15)
    {
      SKCKeyframeSequence::~SKCKeyframeSequence(v15);
      MEMORY[0x1DF0CF560]();
      skcEmitterNode = self->_skcEmitterNode;
    }
    *((_QWORD *)skcEmitterNode + 82) = v7;
  }
  scaleSequence = self->_scaleSequence;
  self->_scaleSequence = v4;

}

- (SKKeyframeSequence)particleScaleSequence
{
  return self->_scaleSequence;
}

- (void)setParticleRotationSequence:(id)a3
{
  SKKeyframeSequence *v4;
  SKCKeyframeSequence *v5;
  uint64_t v6;
  SKCKeyframeSequence *v7;
  uint64_t i;
  double v9;
  double v10;
  void *v11;
  float v12;
  float v13;
  void *skcEmitterNode;
  SKCKeyframeSequence *v15;
  SKKeyframeSequence *rotationSequence;
  float v17;

  v4 = (SKKeyframeSequence *)a3;
  v5 = (SKCKeyframeSequence *)*((_QWORD *)self->_skcEmitterNode + 81);
  if (v5)
  {
    SKCKeyframeSequence::~SKCKeyframeSequence(v5);
    MEMORY[0x1DF0CF560]();
    *((_QWORD *)self->_skcEmitterNode + 81) = 0;
  }
  if (v4)
  {
    v6 = -[SKKeyframeSequence count](v4, "count");
    v7 = (SKCKeyframeSequence *)operator new();
    SKCKeyframeSequence::SKCKeyframeSequence(v7, v6, 1);
    SKCKeyframeSequence::setInterpMode(v7, -[SKKeyframeSequence interpolationMode](v4, "interpolationMode"));
    SKCKeyframeSequence::setRepeatMode(v7, -[SKKeyframeSequence repeatMode](v4, "repeatMode"));
    if (v6)
    {
      for (i = 0; i != v6; ++i)
      {
        -[SKKeyframeSequence getKeyframeTimeForIndex:](v4, "getKeyframeTimeForIndex:", i);
        v10 = v9;
        v17 = 0.0;
        -[SKKeyframeSequence getKeyframeValueForIndex:](v4, "getKeyframeValueForIndex:", i);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "floatValue");
        v13 = v12;

        v17 = v13;
        *(float *)&v10 = v10;
        SKCKeyframeSequence::setKeyframe(v7, i, *(float *)&v10, &v17);
      }
    }
    skcEmitterNode = self->_skcEmitterNode;
    v15 = (SKCKeyframeSequence *)*((_QWORD *)skcEmitterNode + 81);
    if (v15)
    {
      SKCKeyframeSequence::~SKCKeyframeSequence(v15);
      MEMORY[0x1DF0CF560]();
      skcEmitterNode = self->_skcEmitterNode;
    }
    *((_QWORD *)skcEmitterNode + 81) = v7;
  }
  rotationSequence = self->_rotationSequence;
  self->_rotationSequence = v4;

}

- (unsigned)activeParticleCount
{
  return 0;
}

- (id)particleRotationSequence
{
  return self->_rotationSequence;
}

- (void)setEmissionDistance:(double)a3
{
  float v3;

  v3 = a3;
  *((float *)self->_skcEmitterNode + 191) = v3;
}

- (double)emissionDistance
{
  return *((float *)self->_skcEmitterNode + 191);
}

- (void)setEmissionDistanceRange:(double)a3
{
  float v3;

  v3 = a3;
  *((float *)self->_skcEmitterNode + 192) = v3;
}

- (double)emissionDistanceRange
{
  return *((float *)self->_skcEmitterNode + 192);
}

- (void)setWantsNewParticles:(BOOL)a3
{
  _BYTE *skcEmitterNode;

  skcEmitterNode = self->_skcEmitterNode;
  if (skcEmitterNode[561] != a3)
  {
    skcEmitterNode[561] = a3;
    skcEmitterNode[560] = 1;
  }
}

- (BOOL)wantsNewParticles
{
  return *((_BYTE *)self->_skcEmitterNode + 561);
}

- (void)setDensityBased:(BOOL)a3
{
  SKCNode *skcEmitterNode;

  skcEmitterNode = (SKCNode *)self->_skcEmitterNode;
  *((_BYTE *)skcEmitterNode + 616) = a3;
  SKCNode::recomputeFlags(skcEmitterNode, 1);
}

- (BOOL)densityBased
{
  return *((_BYTE *)self->_skcEmitterNode + 616);
}

- (void)setUsesPointSprites:(BOOL)a3
{
  *(_QWORD *)(*((_QWORD *)self->_skcEmitterNode + 74) + 560) = a3;
}

- (BOOL)usesPointSprites
{
  return *(_QWORD *)(*((_QWORD *)self->_skcEmitterNode + 74) + 560) == 1;
}

- (void)setParticleDensity:(double)a3
{
  *((double *)self->_skcEmitterNode + 76) = a3;
}

- (double)particleDensity
{
  return *((double *)self->_skcEmitterNode + 76);
}

- (SKNode)targetNode
{
  return (SKNode *)objc_loadWeakRetained((id *)&self->_target);
}

- (CGFloat)particleZPositionSpeed
{
  return *((float *)self->_skcEmitterNode + 190);
}

- (void)setParticleZPositionSpeed:(CGFloat)particleZPositionSpeed
{
  float v3;
  float *skcEmitterNode;

  v3 = particleZPositionSpeed;
  skcEmitterNode = (float *)self->_skcEmitterNode;
  skcEmitterNode[190] = v3;
  *((_BYTE *)skcEmitterNode + 560) = 1;
}

- (CGSize)particleSize
{
  double *skcEmitterNode;
  double v3;
  double v4;
  CGSize result;

  skcEmitterNode = (double *)self->_skcEmitterNode;
  v3 = skcEmitterNode[92];
  v4 = skcEmitterNode[93];
  result.height = v4;
  result.width = v3;
  return result;
}

- (void)setParticleSize:(CGSize)particleSize
{
  *((CGSize *)self->_skcEmitterNode + 46) = particleSize;
}

- (CGFloat)particleZPosition
{
  return *((float *)self->_skcEmitterNode + 188);
}

- (void)setZPosition:(double)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SKEmitterNode;
  -[SKNode setZPosition:](&v4, sel_setZPosition_, a3);
  SKCEmitterNode::computeZPostion((SKCEmitterNode *)self->_skcEmitterNode);
}

- (void)setParticleZPosition:(CGFloat)particleZPosition
{
  float v3;
  float *skcEmitterNode;

  v3 = particleZPosition;
  skcEmitterNode = (float *)self->_skcEmitterNode;
  skcEmitterNode[188] = v3;
  SKCEmitterNode::computeZPostion((SKCEmitterNode *)skcEmitterNode);
}

- (CGFloat)particleZPositionRange
{
  return *((float *)self->_skcEmitterNode + 189);
}

- (void)setParticleZPositionRange:(CGFloat)particleZPositionRange
{
  float v3;
  float *skcEmitterNode;

  v3 = particleZPositionRange;
  skcEmitterNode = (float *)self->_skcEmitterNode;
  skcEmitterNode[189] = v3;
  *((_BYTE *)skcEmitterNode + 560) = 1;
}

- (void)setParticleColor:(UIColor *)particleColor
{
  _DWORD *skcEmitterNode;
  int v5;
  int v6;
  int v7;
  int v8;
  UIColor *v9;

  v9 = particleColor;
  -[UIColor componentRGBA](v9, "componentRGBA");
  skcEmitterNode = self->_skcEmitterNode;
  skcEmitterNode[196] = v5;
  skcEmitterNode[197] = v6;
  skcEmitterNode[198] = v7;
  skcEmitterNode[199] = v8;

}

- (UIColor)particleColor
{
  double v2;
  double v3;
  double v4;
  double v5;
  _DWORD *skcEmitterNode;

  skcEmitterNode = self->_skcEmitterNode;
  LODWORD(v2) = skcEmitterNode[196];
  LODWORD(v3) = skcEmitterNode[197];
  LODWORD(v4) = skcEmitterNode[198];
  LODWORD(v5) = skcEmitterNode[199];
  return (UIColor *)objc_msgSend(MEMORY[0x1E0CEA478], "colorWithComponentRGBA:", v2, v3, v4, v5);
}

- (void)setParticlePosition:(CGPoint)particlePosition
{
  float x;
  float *skcEmitterNode;
  float y;

  x = particlePosition.x;
  skcEmitterNode = (float *)self->_skcEmitterNode;
  y = particlePosition.y;
  skcEmitterNode[218] = x;
  skcEmitterNode[219] = y;
}

- (CGFloat)particleColorRedRange
{
  return *((float *)self->_skcEmitterNode + 200);
}

- (CGFloat)particleColorGreenRange
{
  return *((float *)self->_skcEmitterNode + 201);
}

- (CGFloat)particleColorBlueRange
{
  return *((float *)self->_skcEmitterNode + 202);
}

- (CGFloat)particleColorAlphaRange
{
  return *((float *)self->_skcEmitterNode + 203);
}

- (CGFloat)particleColorRedSpeed
{
  return *((float *)self->_skcEmitterNode + 204);
}

- (CGFloat)particleColorGreenSpeed
{
  return *((float *)self->_skcEmitterNode + 205);
}

- (CGFloat)particleColorBlueSpeed
{
  return *((float *)self->_skcEmitterNode + 206);
}

- (CGFloat)particleColorAlphaSpeed
{
  return *((float *)self->_skcEmitterNode + 207);
}

- (void)setParticleColorRedRange:(CGFloat)particleColorRedRange
{
  float v3;

  v3 = particleColorRedRange;
  *((float *)self->_skcEmitterNode + 200) = v3;
}

- (void)setParticleColorGreenRange:(CGFloat)particleColorGreenRange
{
  float v3;

  v3 = particleColorGreenRange;
  *((float *)self->_skcEmitterNode + 201) = v3;
}

- (void)setParticleColorBlueRange:(CGFloat)particleColorBlueRange
{
  float v3;

  v3 = particleColorBlueRange;
  *((float *)self->_skcEmitterNode + 202) = v3;
}

- (void)setParticleColorAlphaRange:(CGFloat)particleColorAlphaRange
{
  float v3;

  v3 = particleColorAlphaRange;
  *((float *)self->_skcEmitterNode + 203) = v3;
}

- (void)setParticleColorRedSpeed:(CGFloat)particleColorRedSpeed
{
  float v3;

  v3 = particleColorRedSpeed;
  *((float *)self->_skcEmitterNode + 204) = v3;
}

- (void)setParticleColorGreenSpeed:(CGFloat)particleColorGreenSpeed
{
  float v3;

  v3 = particleColorGreenSpeed;
  *((float *)self->_skcEmitterNode + 205) = v3;
}

- (void)setParticleColorBlueSpeed:(CGFloat)particleColorBlueSpeed
{
  float v3;

  v3 = particleColorBlueSpeed;
  *((float *)self->_skcEmitterNode + 206) = v3;
}

- (void)setParticleColorAlphaSpeed:(CGFloat)particleColorAlphaSpeed
{
  float v3;

  v3 = particleColorAlphaSpeed;
  *((float *)self->_skcEmitterNode + 207) = v3;
}

- (CGPoint)particlePosition
{
  float *skcEmitterNode;
  double v3;
  double v4;
  CGPoint result;

  skcEmitterNode = (float *)self->_skcEmitterNode;
  v3 = skcEmitterNode[218];
  v4 = skcEmitterNode[219];
  result.y = v4;
  result.x = v3;
  return result;
}

- (void)setParticlePositionRange:(CGVector)particlePositionRange
{
  float dx;
  float *skcEmitterNode;
  float dy;

  dx = particlePositionRange.dx;
  skcEmitterNode = (float *)self->_skcEmitterNode;
  dy = particlePositionRange.dy;
  skcEmitterNode[220] = dx;
  skcEmitterNode[221] = dy;
}

- (CGVector)particlePositionRange
{
  float *skcEmitterNode;
  double v3;
  double v4;
  CGVector result;

  skcEmitterNode = (float *)self->_skcEmitterNode;
  v3 = skcEmitterNode[220];
  v4 = skcEmitterNode[221];
  result.dy = v4;
  result.dx = v3;
  return result;
}

- (void)setXAcceleration:(CGFloat)xAcceleration
{
  float v3;

  v3 = xAcceleration;
  *((float *)self->_skcEmitterNode + 226) = v3;
}

- (CGFloat)xAcceleration
{
  return *((float *)self->_skcEmitterNode + 226);
}

- (void)setYAcceleration:(CGFloat)yAcceleration
{
  float v3;

  v3 = yAcceleration;
  *((float *)self->_skcEmitterNode + 227) = v3;
}

- (CGFloat)yAcceleration
{
  return *((float *)self->_skcEmitterNode + 227);
}

- (void)setParticleBirthRate:(CGFloat)particleBirthRate
{
  float v4;

  v4 = particleBirthRate;
  SKCEmitterNode::setBirthRate((SKCEmitterNode *)self->_skcEmitterNode, v4);
  SKCNode::recomputeFlags((SKCNode *)self->_skcEmitterNode, 1);
}

- (CGFloat)particleBirthRate
{
  return *((float *)self->_skcEmitterNode + 228);
}

- (void)setParticleColorBlendFactor:(CGFloat)particleColorBlendFactor
{
  float v3;

  v3 = particleColorBlendFactor;
  *((float *)self->_skcEmitterNode + 208) = v3;
}

- (CGFloat)particleColorBlendFactor
{
  return *((float *)self->_skcEmitterNode + 208);
}

- (void)setParticleColorBlendFactorRange:(CGFloat)particleColorBlendFactorRange
{
  float v3;

  v3 = particleColorBlendFactorRange;
  *((float *)self->_skcEmitterNode + 209) = v3;
}

- (CGFloat)particleColorBlendFactorRange
{
  return *((float *)self->_skcEmitterNode + 209);
}

- (void)setParticleColorBlendFactorSpeed:(CGFloat)particleColorBlendFactorSpeed
{
  float v3;

  v3 = particleColorBlendFactorSpeed;
  *((float *)self->_skcEmitterNode + 210) = v3;
}

- (CGFloat)particleColorBlendFactorSpeed
{
  return *((float *)self->_skcEmitterNode + 210);
}

- (void)setParticleLifetime:(CGFloat)particleLifetime
{
  float v3;
  float *skcEmitterNode;

  v3 = particleLifetime;
  skcEmitterNode = (float *)self->_skcEmitterNode;
  skcEmitterNode[229] = v3;
  *((_DWORD *)skcEmitterNode + 175) = vcvtps_s32_f32((float)((float)(skcEmitterNode[228]* (float)(v3 + (float)(skcEmitterNode[230] * 0.5)))* 1.04)+ 2.0);
}

- (CGFloat)particleLifetime
{
  return *((float *)self->_skcEmitterNode + 229);
}

- (void)setParticleLifetimeRange:(CGFloat)particleLifetimeRange
{
  float v3;
  float *skcEmitterNode;

  v3 = particleLifetimeRange;
  skcEmitterNode = (float *)self->_skcEmitterNode;
  skcEmitterNode[230] = v3;
  *((_DWORD *)skcEmitterNode + 175) = vcvtps_s32_f32((float)((float)(skcEmitterNode[228]* (float)(skcEmitterNode[229] + (float)(v3 * 0.5)))* 1.04)+ 2.0);
}

- (CGFloat)particleLifetimeRange
{
  return *((float *)self->_skcEmitterNode + 230);
}

- (void)setParticleRotation:(CGFloat)particleRotation
{
  float v3;

  v3 = particleRotation;
  *((float *)self->_skcEmitterNode + 231) = v3;
}

- (CGFloat)particleRotation
{
  return *((float *)self->_skcEmitterNode + 231);
}

- (void)setParticleRotationRange:(CGFloat)particleRotationRange
{
  float v3;

  v3 = particleRotationRange;
  *((float *)self->_skcEmitterNode + 232) = v3;
}

- (CGFloat)particleRotationRange
{
  return *((float *)self->_skcEmitterNode + 232);
}

- (void)setParticleRotationSpeed:(CGFloat)particleRotationSpeed
{
  float v3;

  v3 = particleRotationSpeed;
  *((float *)self->_skcEmitterNode + 233) = v3;
}

- (CGFloat)particleRotationSpeed
{
  return *((float *)self->_skcEmitterNode + 233);
}

- (void)setParticleScale:(CGFloat)particleScale
{
  float v3;

  v3 = particleScale;
  *((float *)self->_skcEmitterNode + 234) = v3;
}

- (CGFloat)particleScale
{
  return *((float *)self->_skcEmitterNode + 234);
}

- (void)setParticleScaleRange:(CGFloat)particleScaleRange
{
  float v3;

  v3 = particleScaleRange;
  *((float *)self->_skcEmitterNode + 235) = v3;
}

- (CGFloat)particleScaleRange
{
  return *((float *)self->_skcEmitterNode + 235);
}

- (void)setParticleScaleSpeed:(CGFloat)particleScaleSpeed
{
  float v3;

  v3 = particleScaleSpeed;
  *((float *)self->_skcEmitterNode + 236) = v3;
}

- (CGFloat)particleScaleSpeed
{
  return *((float *)self->_skcEmitterNode + 236);
}

- (void)setParticleAlpha:(CGFloat)particleAlpha
{
  float v3;

  v3 = particleAlpha;
  *((float *)self->_skcEmitterNode + 237) = v3;
}

- (CGFloat)particleAlpha
{
  return *((float *)self->_skcEmitterNode + 237);
}

- (void)setParticleAlphaRange:(CGFloat)particleAlphaRange
{
  float v3;

  v3 = particleAlphaRange;
  *((float *)self->_skcEmitterNode + 238) = v3;
}

- (CGFloat)particleAlphaRange
{
  return *((float *)self->_skcEmitterNode + 238);
}

- (void)setParticleAlphaSpeed:(CGFloat)particleAlphaSpeed
{
  float v3;

  v3 = particleAlphaSpeed;
  *((float *)self->_skcEmitterNode + 239) = v3;
}

- (CGFloat)particleAlphaSpeed
{
  return *((float *)self->_skcEmitterNode + 239);
}

- (void)setParticleSpeed:(CGFloat)particleSpeed
{
  float v3;

  v3 = particleSpeed;
  *((float *)self->_skcEmitterNode + 222) = v3;
}

- (CGFloat)particleSpeed
{
  return *((float *)self->_skcEmitterNode + 222);
}

- (void)setParticleSpeedRange:(CGFloat)particleSpeedRange
{
  float v3;

  v3 = particleSpeedRange;
  *((float *)self->_skcEmitterNode + 223) = v3;
}

- (CGFloat)particleSpeedRange
{
  return *((float *)self->_skcEmitterNode + 223);
}

- (void)setEmissionAngle:(CGFloat)emissionAngle
{
  float v3;

  v3 = emissionAngle;
  *((float *)self->_skcEmitterNode + 224) = v3;
}

- (CGFloat)emissionAngle
{
  return *((float *)self->_skcEmitterNode + 224);
}

- (void)setEmissionAngleRange:(CGFloat)emissionAngleRange
{
  float v3;

  v3 = emissionAngleRange;
  *((float *)self->_skcEmitterNode + 225) = v3;
}

- (CGFloat)emissionAngleRange
{
  return *((float *)self->_skcEmitterNode + 225);
}

- (void)setParticleTexture:(SKTexture *)particleTexture
{
  id *skcEmitterNode;
  SKTexture *v6;

  v6 = particleTexture;
  objc_storeStrong((id *)&self->_particleTexture, particleTexture);
  skcEmitterNode = (id *)self->_skcEmitterNode;
  if (skcEmitterNode[120] != v6)
  {
    objc_storeStrong(skcEmitterNode + 120, particleTexture);
    objc_storeStrong((id *)(*((_QWORD *)self->_skcEmitterNode + 74) + 568), particleTexture);
  }

}

- (SKTexture)particleTexture
{
  return (SKTexture *)*((id *)self->_skcEmitterNode + 120);
}

- (void)setParticleBlendMode:(SKBlendMode)particleBlendMode
{
  void *skcEmitterNode;

  skcEmitterNode = self->_skcEmitterNode;
  if (*((_QWORD *)skcEmitterNode + 121) != particleBlendMode)
    *((_QWORD *)skcEmitterNode + 121) = particleBlendMode;
  SKCNode::setBlendMode(*((SKCNode **)skcEmitterNode + 74), particleBlendMode);
}

- (SKBlendMode)particleBlendMode
{
  return *((_QWORD *)self->_skcEmitterNode + 121);
}

- (SKAction)particleAction
{
  return (SKAction *)(id)objc_msgSend(*((id *)self->_skcEmitterNode + 72), "copy");
}

- (void)setParticleAction:(SKAction *)particleAction
{
  uint64_t v4;
  _QWORD *skcEmitterNode;
  void *v6;
  SKAction *v7;

  v7 = particleAction;
  v4 = -[SKAction copy](v7, "copy");
  skcEmitterNode = self->_skcEmitterNode;
  v6 = (void *)skcEmitterNode[72];
  skcEmitterNode[72] = v4;

  *((_BYTE *)self->_skcEmitterNode + 560) = 1;
}

- (NSUInteger)numParticlesToEmit
{
  return *((_QWORD *)self->_skcEmitterNode + 85);
}

- (void)setNumParticlesToEmit:(NSUInteger)numParticlesToEmit
{
  *((_QWORD *)self->_skcEmitterNode + 85) = numParticlesToEmit;
}

- (void)resetSimulation
{
  SKCEmitterNode::resetSimulation((SKCParticleSystem **)self->_skcEmitterNode);
}

- (void)setFieldBitMask:(uint32_t)fieldBitMask
{
  SKCNode *skcEmitterNode;

  skcEmitterNode = (SKCNode *)self->_skcEmitterNode;
  *((_DWORD *)skcEmitterNode + 244) = fieldBitMask;
  SKCNode::recomputeFlags(skcEmitterNode, 1);
}

- (uint32_t)fieldBitMask
{
  return *((_DWORD *)self->_skcEmitterNode + 244);
}

- (SKEmitterNode)init
{
  SKEmitterNode *v2;
  SKEmitterNode *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SKEmitterNode;
  v2 = -[SKNode init](&v5, sel_init);
  v3 = v2;
  if (v2)
  {
    -[SKEmitterNode commonInit](v2, "commonInit");
    -[SKEmitterNode setTargetNode:](v3, "setTargetNode:", 0);
  }
  return v3;
}

- (SKEmitterNode)initWithMinimumParticleCapacity:(unint64_t)a3
{
  int v3;
  SKEmitterNode *v4;
  SKEmitterNode *v5;
  _DWORD *skcEmitterNode;
  objc_super v8;

  v3 = a3;
  v8.receiver = self;
  v8.super_class = (Class)SKEmitterNode;
  v4 = -[SKNode init](&v8, sel_init);
  v5 = v4;
  if (v4)
  {
    -[SKEmitterNode commonInit](v4, "commonInit");
    -[SKEmitterNode setTargetNode:](v5, "setTargetNode:", 0);
    skcEmitterNode = v5->_skcEmitterNode;
    skcEmitterNode[245] = v3;
    skcEmitterNode[246] = 4 * v3;
  }
  return v5;
}

- (SKEmitterNode)initWithMinimumParticleCapacity:(unint64_t)a3 minimumPositionBufferCapacity:(unint64_t)a4
{
  int v4;
  int v5;
  SKEmitterNode *v6;
  SKEmitterNode *v7;
  _DWORD *skcEmitterNode;
  objc_super v10;

  v4 = a4;
  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)SKEmitterNode;
  v6 = -[SKNode init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    -[SKEmitterNode commonInit](v6, "commonInit");
    -[SKEmitterNode setTargetNode:](v7, "setTargetNode:", 0);
    skcEmitterNode = v7->_skcEmitterNode;
    skcEmitterNode[245] = v5;
    skcEmitterNode[246] = v4;
  }
  return v7;
}

- (SKEmitterNode)initWithCoder:(id)a3
{
  id v4;
  SKEmitterNode *v5;
  SKEmitterNode *v6;
  float *skcEmitterNode;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  float v16;
  float v17;
  float v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  float v26;
  float v27;
  float v28;
  double v29;
  void *v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  uint64_t v39;
  uint64_t v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  float v51;
  float v52;
  float v53;
  double v54;
  double v55;
  double v56;
  double v57;
  double v58;
  double v59;
  double v60;
  double v61;
  double v62;
  double v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  objc_super v76;

  v4 = a3;
  v76.receiver = self;
  v76.super_class = (Class)SKEmitterNode;
  v5 = -[SKNode initWithCoder:](&v76, sel_initWithCoder_, v4);
  v6 = v5;
  if (v5)
  {
    -[SKEmitterNode commonInit](v5, "commonInit");
    skcEmitterNode = (float *)v6->_skcEmitterNode;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("_startColorMix"));
    *(float *)&v8 = v8;
    skcEmitterNode[208] = *(float *)&v8;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("_startColorBlendVariance"));
    *(float *)&v9 = v9;
    skcEmitterNode[209] = *(float *)&v9;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("_startColorR"));
    v11 = v10;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("_startColorG"));
    v13 = v12;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("_startColorB"));
    v15 = v14;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("_startColorA"));
    v16 = v11;
    v17 = v13;
    v18 = v15;
    skcEmitterNode[196] = v16;
    skcEmitterNode[197] = v17;
    *(float *)&v19 = v19;
    skcEmitterNode[198] = v18;
    skcEmitterNode[199] = *(float *)&v19;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("_startColorVarianceR"));
    v21 = v20;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("_startColorVarianceG"));
    v23 = v22;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("_startColorVarianceB"));
    v25 = v24;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("_startColorVarianceA"));
    v26 = v21;
    v27 = v23;
    v28 = v25;
    *(float *)&v29 = v29;
    skcEmitterNode[200] = v26;
    skcEmitterNode[201] = v27;
    skcEmitterNode[202] = v28;
    skcEmitterNode[203] = *(float *)&v29;
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_particleTexture"));
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKEmitterNode setParticleTexture:](v6, "setParticleTexture:", v30);

    objc_msgSend(v4, "decodeCGPointForKey:", CFSTR("_startPosition"));
    -[SKEmitterNode setParticlePosition:](v6, "setParticlePosition:");
    objc_msgSend(v4, "decodeCGVectorForKey:", CFSTR("_startPositionVariance"));
    -[SKEmitterNode setParticlePositionRange:](v6, "setParticlePositionRange:");
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("_startZPosition"));
    *(float *)&v31 = v31;
    skcEmitterNode[188] = *(float *)&v31;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("_startZPositionVariance"));
    *(float *)&v32 = v32;
    skcEmitterNode[189] = *(float *)&v32;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("_lifetime"));
    *(float *)&v33 = v33;
    skcEmitterNode[229] = *(float *)&v33;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("_lifetimeVariance"));
    *(float *)&v34 = v34;
    skcEmitterNode[230] = *(float *)&v34;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("_startOpacity"));
    *(float *)&v35 = v35;
    skcEmitterNode[237] = *(float *)&v35;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("_startOpacityVariance"));
    *(float *)&v36 = v36;
    skcEmitterNode[238] = *(float *)&v36;
    -[SKEmitterNode setParticleBlendMode:](v6, "setParticleBlendMode:", (int)objc_msgSend(v4, "decodeIntForKey:", CFSTR("_particleBlendMode")));
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("_startRotation"));
    *(float *)&v37 = v37;
    skcEmitterNode[231] = *(float *)&v37;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("_startRotationVariance"));
    *(float *)&v38 = v38;
    skcEmitterNode[232] = *(float *)&v38;
    objc_msgSend(v4, "decodeCGSizeForKey:", CFSTR("_startSize"));
    *((_QWORD *)skcEmitterNode + 92) = v39;
    *((_QWORD *)skcEmitterNode + 93) = v40;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("_startScale"));
    *(float *)&v41 = v41;
    skcEmitterNode[234] = *(float *)&v41;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("_startScaleVariance"));
    *(float *)&v42 = v42;
    skcEmitterNode[235] = *(float *)&v42;
    objc_msgSend(v4, "decodeCGPointForKey:", CFSTR("_acceleration"));
    *(float *)&v43 = v43;
    *(float *)&v44 = v44;
    skcEmitterNode[226] = *(float *)&v43;
    skcEmitterNode[227] = *(float *)&v44;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("_colorSpeedR"));
    v46 = v45;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("_colorSpeedG"));
    v48 = v47;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("_colorSpeedB"));
    v50 = v49;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("_colorSpeedA"));
    v51 = v46;
    v52 = v48;
    v53 = v50;
    skcEmitterNode[204] = v51;
    skcEmitterNode[205] = v52;
    *(float *)&v54 = v54;
    skcEmitterNode[206] = v53;
    skcEmitterNode[207] = *(float *)&v54;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("_colorBlendSpeed"));
    *(float *)&v55 = v55;
    skcEmitterNode[210] = *(float *)&v55;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("_rotationSpeed"));
    *(float *)&v56 = v56;
    skcEmitterNode[233] = *(float *)&v56;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("_scaleSpeed"));
    *(float *)&v57 = v57;
    skcEmitterNode[236] = *(float *)&v57;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("_opacitySpeed"));
    *(float *)&v58 = v58;
    skcEmitterNode[239] = *(float *)&v58;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("_startSpeed"));
    *(float *)&v59 = v59;
    skcEmitterNode[222] = *(float *)&v59;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("_startSpeedVariance"));
    *(float *)&v60 = v60;
    skcEmitterNode[223] = *(float *)&v60;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("_emissionAngle"));
    *(float *)&v61 = v61;
    skcEmitterNode[224] = *(float *)&v61;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("_emissionAngleVariance"));
    *(float *)&v62 = v62;
    skcEmitterNode[225] = *(float *)&v62;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("_zPositionSpeed"));
    *(float *)&v63 = v63;
    skcEmitterNode[190] = *(float *)&v63;
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_target"));
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKEmitterNode setTargetNode:](v6, "setTargetNode:", v64);

    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("_birthrate"));
    -[SKEmitterNode setParticleBirthRate:](v6, "setParticleBirthRate:");
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_particleAction"));
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKEmitterNode setParticleAction:](v6, "setParticleAction:", v65);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_numParticlesToEmit"));
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKEmitterNode setNumParticlesToEmit:](v6, "setNumParticlesToEmit:", objc_msgSend(v66, "unsignedIntegerValue"));

    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("_emissionDistance"));
    -[SKEmitterNode setEmissionDistance:](v6, "setEmissionDistance:");
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("_emissionDistanceRange"));
    -[SKEmitterNode setEmissionDistanceRange:](v6, "setEmissionDistanceRange:");
    -[SKEmitterNode setFieldBitMask:](v6, "setFieldBitMask:", objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("_fieldBitMask")));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_particleAlphaSequence"));
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKEmitterNode setParticleAlphaSequence:](v6, "setParticleAlphaSequence:", v67);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_particleColorSequence"));
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKEmitterNode setParticleColorSequence:](v6, "setParticleColorSequence:", v68);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_particleColorBlendFactorSequence"));
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKEmitterNode setParticleColorBlendFactorSequence:](v6, "setParticleColorBlendFactorSequence:", v69);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_particleScaleSequence"));
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKEmitterNode setParticleScaleSequence:](v6, "setParticleScaleSequence:", v70);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_particleRotationSequence"));
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKEmitterNode setParticleRotationSequence:](v6, "setParticleRotationSequence:", v71);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_fieldInfluenceSequence"));
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKEmitterNode setFieldInfluenceSequence:](v6, "setFieldInfluenceSequence:", v72);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_particleSpeedSequence"));
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKEmitterNode setParticleSpeedSequence:](v6, "setParticleSpeedSequence:", v73);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_shader"));
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKEmitterNode setShader:](v6, "setShader:", v74);

    *((_BYTE *)skcEmitterNode + 560) = 1;
  }

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  float *skcEmitterNode;
  void *v6;
  id WeakRetained;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  objc_super v17;

  v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)SKEmitterNode;
  -[SKNode encodeWithCoder:](&v17, sel_encodeWithCoder_, v4);
  skcEmitterNode = (float *)self->_skcEmitterNode;
  -[SKEmitterNode particleAction](self, "particleAction");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("_particleAction"));

  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("_startColorMix"), skcEmitterNode[208]);
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("_startColorBlendVariance"), skcEmitterNode[209]);
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("_startColorR"), skcEmitterNode[196]);
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("_startColorG"), skcEmitterNode[197]);
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("_startColorB"), skcEmitterNode[198]);
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("_startColorA"), skcEmitterNode[199]);
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("_startColorVarianceR"), skcEmitterNode[200]);
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("_startColorVarianceG"), skcEmitterNode[201]);
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("_startColorVarianceB"), skcEmitterNode[202]);
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("_startColorVarianceA"), skcEmitterNode[203]);
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("_birthrate"), skcEmitterNode[228]);
  objc_msgSend(v4, "encodeObject:forKey:", *((_QWORD *)skcEmitterNode + 120), CFSTR("_particleTexture"));
  -[SKEmitterNode particlePosition](self, "particlePosition");
  objc_msgSend(v4, "encodeCGPoint:forKey:", CFSTR("_startPosition"));
  -[SKEmitterNode particlePositionRange](self, "particlePositionRange");
  objc_msgSend(v4, "encodeCGVector:forKey:", CFSTR("_startPositionVariance"));
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("_startZPosition"), skcEmitterNode[188]);
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("_startZPositionVariance"), skcEmitterNode[189]);
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("_lifetime"), skcEmitterNode[229]);
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("_lifetimeVariance"), skcEmitterNode[230]);
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("_startOpacity"), skcEmitterNode[237]);
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("_startOpacityVariance"), skcEmitterNode[238]);
  objc_msgSend(v4, "encodeInteger:forKey:", *((_QWORD *)skcEmitterNode + 121), CFSTR("_particleBlendMode"));
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("_startRotation"), skcEmitterNode[231]);
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("_startRotationVariance"), skcEmitterNode[232]);
  objc_msgSend(v4, "encodeCGSize:forKey:", CFSTR("_startSize"), *((double *)skcEmitterNode + 92), *((double *)skcEmitterNode + 93));
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("_startScale"), skcEmitterNode[234]);
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("_startScaleVariance"), skcEmitterNode[235]);
  objc_msgSend(v4, "encodeCGPoint:forKey:", CFSTR("_acceleration"), skcEmitterNode[226], skcEmitterNode[227]);
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("_colorSpeedR"), skcEmitterNode[204]);
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("_colorSpeedG"), skcEmitterNode[205]);
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("_colorSpeedB"), skcEmitterNode[206]);
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("_colorSpeedA"), skcEmitterNode[207]);
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("_colorBlendSpeed"), skcEmitterNode[210]);
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("_rotationSpeed"), skcEmitterNode[233]);
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("_scaleSpeed"), skcEmitterNode[236]);
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("_opacitySpeed"), skcEmitterNode[239]);
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("_startSpeed"), skcEmitterNode[222]);
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("_startSpeedVariance"), skcEmitterNode[223]);
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("_emissionAngle"), skcEmitterNode[224]);
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("_emissionAngleVariance"), skcEmitterNode[225]);
  WeakRetained = objc_loadWeakRetained((id *)&self->_target);
  objc_msgSend(v4, "encodeObject:forKey:", WeakRetained, CFSTR("_target"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[SKEmitterNode numParticlesToEmit](self, "numParticlesToEmit"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("_numParticlesToEmit"));

  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("_zPositionSpeed"), skcEmitterNode[190]);
  -[SKEmitterNode emissionDistance](self, "emissionDistance");
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("_emissionDistance"));
  -[SKEmitterNode emissionDistanceRange](self, "emissionDistanceRange");
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("_emissionDistanceRange"));
  objc_msgSend(v4, "encodeInt32:forKey:", -[SKEmitterNode fieldBitMask](self, "fieldBitMask"), CFSTR("_fieldBitMask"));
  -[SKEmitterNode particleAlphaSequence](self, "particleAlphaSequence");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v9, CFSTR("_particleAlphaSequence"));

  -[SKEmitterNode particleColorSequence](self, "particleColorSequence");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v10, CFSTR("_particleColorSequence"));

  -[SKEmitterNode particleColorBlendFactorSequence](self, "particleColorBlendFactorSequence");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v11, CFSTR("_particleColorBlendFactorSequence"));

  -[SKEmitterNode particleScaleSequence](self, "particleScaleSequence");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v12, CFSTR("_particleScaleSequence"));

  -[SKEmitterNode particleRotationSequence](self, "particleRotationSequence");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v13, CFSTR("_particleRotationSequence"));

  -[SKEmitterNode fieldInfluenceSequence](self, "fieldInfluenceSequence");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v14, CFSTR("_fieldInfluenceSequence"));

  -[SKEmitterNode particleSpeedSequence](self, "particleSpeedSequence");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v15, CFSTR("_particleSpeedSequence"));

  -[SKEmitterNode shader](self, "shader");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v16, CFSTR("_shader"));

}

- (void)copyParticlePropertiesToNode:(id)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  _DWORD *skcEmitterNode;
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
  _QWORD *v27;

  v27 = a3;
  v4 = v27[19];
  -[SKEmitterNode particleColor](self, "particleColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "setParticleColor:", v5);

  -[SKEmitterNode particleColorRedRange](self, "particleColorRedRange");
  objc_msgSend(v27, "setParticleColorRedRange:");
  -[SKEmitterNode particleColorGreenRange](self, "particleColorGreenRange");
  objc_msgSend(v27, "setParticleColorGreenRange:");
  -[SKEmitterNode particleColorBlueRange](self, "particleColorBlueRange");
  objc_msgSend(v27, "setParticleColorBlueRange:");
  -[SKEmitterNode particleColorAlphaRange](self, "particleColorAlphaRange");
  objc_msgSend(v27, "setParticleColorAlphaRange:");
  -[SKEmitterNode particleColorRedSpeed](self, "particleColorRedSpeed");
  objc_msgSend(v27, "setParticleColorRedSpeed:");
  -[SKEmitterNode particleColorGreenSpeed](self, "particleColorGreenSpeed");
  objc_msgSend(v27, "setParticleColorGreenSpeed:");
  -[SKEmitterNode particleColorBlueSpeed](self, "particleColorBlueSpeed");
  objc_msgSend(v27, "setParticleColorBlueSpeed:");
  -[SKEmitterNode particleColorAlphaSpeed](self, "particleColorAlphaSpeed");
  objc_msgSend(v27, "setParticleColorAlphaSpeed:");
  -[SKEmitterNode particleColorBlendFactor](self, "particleColorBlendFactor");
  objc_msgSend(v27, "setParticleColorBlendFactor:");
  -[SKEmitterNode particleColorBlendFactorRange](self, "particleColorBlendFactorRange");
  objc_msgSend(v27, "setParticleColorBlendFactorRange:");
  -[SKEmitterNode particleColorBlendFactorSpeed](self, "particleColorBlendFactorSpeed");
  objc_msgSend(v27, "setParticleColorBlendFactorSpeed:");
  -[SKEmitterNode particlePosition](self, "particlePosition");
  objc_msgSend(v27, "setParticlePosition:");
  -[SKEmitterNode particlePositionRange](self, "particlePositionRange");
  objc_msgSend(v27, "setParticlePositionRange:");
  -[SKEmitterNode xAcceleration](self, "xAcceleration");
  objc_msgSend(v27, "setXAcceleration:");
  -[SKEmitterNode yAcceleration](self, "yAcceleration");
  objc_msgSend(v27, "setYAcceleration:");
  -[SKEmitterNode particleLifetime](self, "particleLifetime");
  objc_msgSend(v27, "setParticleLifetime:");
  -[SKEmitterNode particleLifetimeRange](self, "particleLifetimeRange");
  objc_msgSend(v27, "setParticleLifetimeRange:");
  -[SKEmitterNode particleRotation](self, "particleRotation");
  objc_msgSend(v27, "setParticleRotation:");
  -[SKEmitterNode particleRotationRange](self, "particleRotationRange");
  objc_msgSend(v27, "setParticleRotationRange:");
  -[SKEmitterNode particleRotationSpeed](self, "particleRotationSpeed");
  objc_msgSend(v27, "setParticleRotationSpeed:");
  -[SKEmitterNode particleScale](self, "particleScale");
  objc_msgSend(v27, "setParticleScale:");
  -[SKEmitterNode particleScaleRange](self, "particleScaleRange");
  objc_msgSend(v27, "setParticleScaleRange:");
  -[SKEmitterNode particleScaleSpeed](self, "particleScaleSpeed");
  objc_msgSend(v27, "setParticleScaleSpeed:");
  -[SKEmitterNode particleAlpha](self, "particleAlpha");
  objc_msgSend(v27, "setParticleAlpha:");
  -[SKEmitterNode particleAlphaRange](self, "particleAlphaRange");
  objc_msgSend(v27, "setParticleAlphaRange:");
  -[SKEmitterNode particleAlphaSpeed](self, "particleAlphaSpeed");
  objc_msgSend(v27, "setParticleAlphaSpeed:");
  -[SKEmitterNode particleTexture](self, "particleTexture");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "setParticleTexture:", v6);

  objc_msgSend(v27, "setParticleBlendMode:", -[SKEmitterNode particleBlendMode](self, "particleBlendMode"));
  -[SKEmitterNode particleSpeed](self, "particleSpeed");
  objc_msgSend(v27, "setParticleSpeed:");
  -[SKEmitterNode particleSpeedRange](self, "particleSpeedRange");
  objc_msgSend(v27, "setParticleSpeedRange:");
  -[SKEmitterNode emissionAngle](self, "emissionAngle");
  objc_msgSend(v27, "setEmissionAngle:");
  -[SKEmitterNode emissionAngleRange](self, "emissionAngleRange");
  objc_msgSend(v27, "setEmissionAngleRange:");
  -[SKEmitterNode targetNode](self, "targetNode");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "setTargetNode:", v7);

  -[SKEmitterNode particleZPosition](self, "particleZPosition");
  objc_msgSend(v27, "setParticleZPosition:");
  skcEmitterNode = self->_skcEmitterNode;
  *(_DWORD *)(v4 + 756) = skcEmitterNode[189];
  *(_DWORD *)(v4 + 760) = skcEmitterNode[190];
  -[SKEmitterNode particleAction](self, "particleAction");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "setParticleAction:", v9);

  objc_msgSend(v27, "setNumParticlesToEmit:", -[SKEmitterNode numParticlesToEmit](self, "numParticlesToEmit"));
  objc_msgSend(v27, "setFieldBitMask:", -[SKEmitterNode fieldBitMask](self, "fieldBitMask"));
  -[SKNode _info](self, "_info");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v10, "mutableCopy");
  objc_msgSend(v27, "set_info:", v11);

  -[SKEmitterNode shader](self, "shader");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "setShader:", v12);

  objc_msgSend(v27, "setDensityBased:", -[SKEmitterNode densityBased](self, "densityBased"));
  -[SKEmitterNode particleDensity](self, "particleDensity");
  objc_msgSend(v27, "setParticleDensity:");
  -[SKEmitterNode particleSize](self, "particleSize");
  objc_msgSend(v27, "setParticleSize:");
  objc_msgSend(v27, "setWantsNewParticles:", -[SKEmitterNode wantsNewParticles](self, "wantsNewParticles"));
  -[SKEmitterNode particleAlphaSequence](self, "particleAlphaSequence");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v13, "copy");
  objc_msgSend(v27, "setParticleAlphaSequence:", v14);

  -[SKEmitterNode particleScaleSequence](self, "particleScaleSequence");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)objc_msgSend(v15, "copy");
  objc_msgSend(v27, "setParticleScaleSequence:", v16);

  -[SKEmitterNode particleRotationSequence](self, "particleRotationSequence");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (void *)objc_msgSend(v17, "copy");
  objc_msgSend(v27, "setParticleRotationSequence:", v18);

  -[SKEmitterNode particleColorBlendFactorSequence](self, "particleColorBlendFactorSequence");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = (void *)objc_msgSend(v19, "copy");
  objc_msgSend(v27, "setParticleColorBlendFactorSequence:", v20);

  -[SKEmitterNode particleColorSequence](self, "particleColorSequence");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = (void *)objc_msgSend(v21, "copy");
  objc_msgSend(v27, "setParticleColorSequence:", v22);

  -[SKEmitterNode fieldInfluenceSequence](self, "fieldInfluenceSequence");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = (void *)objc_msgSend(v23, "copy");
  objc_msgSend(v27, "setFieldInfluenceSequence:", v24);

  -[SKEmitterNode particleSpeedSequence](self, "particleSpeedSequence");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = (void *)objc_msgSend(v25, "copy");
  objc_msgSend(v27, "setParticleSpeedSequence:", v26);

  -[SKEmitterNode emissionDistance](self, "emissionDistance");
  objc_msgSend(v27, "setEmissionDistance:");
  -[SKEmitterNode emissionDistanceRange](self, "emissionDistanceRange");
  objc_msgSend(v27, "setEmissionDistanceRange:");
  -[SKEmitterNode particleBirthRate](self, "particleBirthRate");
  objc_msgSend(v27, "setParticleBirthRate:");

}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v4;
  uint64_t v5;
  _DWORD *skcEmitterNode;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SKEmitterNode;
  v4 = -[SKNode copyWithZone:](&v8, sel_copyWithZone_, a3);
  -[SKEmitterNode copyParticlePropertiesToNode:](self, "copyParticlePropertiesToNode:", v4);
  v5 = v4[19];
  skcEmitterNode = self->_skcEmitterNode;
  *(_DWORD *)(v5 + 980) = skcEmitterNode[245];
  *(_DWORD *)(v5 + 984) = skcEmitterNode[246];
  objc_msgSend(v4, "setUsesPointSprites:", -[SKEmitterNode usesPointSprites](self, "usesPointSprites"));
  return v4;
}

- (void)advanceSimulationTime:(NSTimeInterval)sec
{
  float *skcEmitterNode;
  float v4;
  float v5;

  skcEmitterNode = (float *)self->_skcEmitterNode;
  v4 = skcEmitterNode[230];
  if ((float)(skcEmitterNode[229] + v4) < sec)
    sec = (float)(skcEmitterNode[229] + v4);
  if (sec > 0.0)
  {
    v5 = sec;
    SKCEmitterNode::advanceSimulationTime((SKCEmitterNode *)skcEmitterNode, v5);
  }
}

- (void)setShader:(SKShader *)shader
{
  SKShader *v5;

  v5 = shader;
  objc_storeStrong((id *)(*((_QWORD *)self->_skcEmitterNode + 74) + 576), shader);
  SKCNode::setDirty(*((SKCNode **)self->_skcEmitterNode + 74));
  SKCNode::recomputeFlags(*((SKCNode **)self->_skcEmitterNode + 74), 1);
  -[SKShader _addTargetNode:](v5, "_addTargetNode:", self);

}

- (SKShader)shader
{
  return (SKShader *)*(id *)(*((_QWORD *)self->_skcEmitterNode + 74) + 576);
}

- (void)dealloc
{
  void *v3;
  SKCEmitterNode *skcEmitterNode;
  SKCEmitterNode *v5;
  objc_super v6;

  if (self->_skcEmitterNode)
  {
    -[SKEmitterNode targetNode](self, "targetNode");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (v3)
      SKCEmitterNode::clearTargetNode((SKCEmitterNode *)self->_skcEmitterNode);
    SKCEmitterNode::removeSubEmitterNodes((SKCEmitterNode *)self->_skcEmitterNode);
    skcEmitterNode = (SKCEmitterNode *)self->_skcEmitterNode;
    v5 = (SKCEmitterNode *)*((_QWORD *)skcEmitterNode + 124);
    if (v5)
      SKCEmitterNode::removeSubEmitterNode(v5, skcEmitterNode);

  }
  v6.receiver = self;
  v6.super_class = (Class)SKEmitterNode;
  -[SKNode dealloc](&v6, sel_dealloc);
}

- (SKAttributeValue)valueForAttributeNamed:(NSString *)key
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SKEmitterNode;
  -[SKNode valueForAttributeNamed:](&v4, sel_valueForAttributeNamed_, key);
  return (SKAttributeValue *)(id)objc_claimAutoreleasedReturnValue();
}

- (void)setValue:(SKAttributeValue *)value forAttributeNamed:(NSString *)key
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SKEmitterNode;
  -[SKNode setValue:forAttributeNamed:](&v4, sel_setValue_forAttributeNamed_, value, key);
}

+ (id)debugHierarchyPropertyDescriptions
{
  const CFDictionaryKeyCallBacks *v2;
  const CFDictionaryValueCallBacks *v3;
  __CFDictionary *Mutable;
  __CFDictionary *v5;
  __CFDictionary *v6;
  __CFDictionary *v7;
  __CFDictionary *v8;
  __CFDictionary *v9;
  CFNumberRef v10;
  CFNumberRef v11;
  void *v12;
  uint64_t v14;
  _QWORD v15[7];

  v15[6] = *MEMORY[0x1E0C80C00];
  v2 = (const CFDictionaryKeyCallBacks *)MEMORY[0x1E0C9AEB8];
  v3 = (const CFDictionaryValueCallBacks *)MEMORY[0x1E0C9B3A0];
  Mutable = CFDictionaryCreateMutable(0, 7, MEMORY[0x1E0C9AEB8], MEMORY[0x1E0C9B3A0]);
  CFDictionaryAddValue(Mutable, CFSTR("propertyName"), CFSTR("particleColor"));
  CFDictionaryAddValue(Mutable, CFSTR("propertyRuntimeType"), CFSTR("CGColor"));
  CFDictionaryAddValue(Mutable, CFSTR("propertyLogicalType"), CFSTR("DebugHierarchyLogicalPropertyTypeColor"));
  CFDictionaryAddValue(Mutable, CFSTR("propertyFormat"), CFSTR("color"));
  v15[0] = Mutable;
  v5 = CFDictionaryCreateMutable(0, 7, v2, v3);
  CFDictionaryAddValue(v5, CFSTR("propertyName"), CFSTR("particleTexture"));
  CFDictionaryAddValue(v5, CFSTR("propertyRuntimeType"), CFSTR("CGImage"));
  CFDictionaryAddValue(v5, CFSTR("propertyLogicalType"), CFSTR("DebugHierarchyLogicalPropertyTypeImage"));
  CFDictionaryAddValue(v5, CFSTR("propertyFormat"), CFSTR("public.data"));
  v15[1] = v5;
  v6 = CFDictionaryCreateMutable(0, 7, MEMORY[0x1E0C9AEB8], MEMORY[0x1E0C9B3A0]);
  CFDictionaryAddValue(v6, CFSTR("propertyName"), CFSTR("shader"));
  CFDictionaryAddValue(v6, CFSTR("propertyLogicalType"), CFSTR("DebugHierarchyLogicalPropertyTypeObjectInfo"));
  CFDictionaryAddValue(v6, CFSTR("propertyFormat"), CFSTR("objectInfo"));
  v15[2] = v6;
  v7 = CFDictionaryCreateMutable(0, 7, MEMORY[0x1E0C9AEB8], MEMORY[0x1E0C9B3A0]);
  CFDictionaryAddValue(v7, CFSTR("propertyName"), CFSTR("targetNode"));
  CFDictionaryAddValue(v7, CFSTR("propertyLogicalType"), CFSTR("DebugHierarchyLogicalPropertyTypeObjectInfo"));
  CFDictionaryAddValue(v7, CFSTR("propertyFormat"), CFSTR("objectInfo"));
  v15[3] = v7;
  v8 = CFDictionaryCreateMutable(0, 7, MEMORY[0x1E0C9AEB8], MEMORY[0x1E0C9B3A0]);
  CFDictionaryAddValue(v8, CFSTR("propertyName"), CFSTR("particleBlendMode"));
  CFDictionaryAddValue(v8, CFSTR("propertyRuntimeType"), CFSTR("SKBlendMode"));
  CFDictionaryAddValue(v8, CFSTR("propertyLogicalType"), CFSTR("DebugHierarchyLogicalPropertyTypeEnum"));
  CFDictionaryAddValue(v8, CFSTR("propertyFormat"), CFSTR("uinteger"));
  v15[4] = v8;
  v9 = CFDictionaryCreateMutable(0, 7, MEMORY[0x1E0C9AEB8], MEMORY[0x1E0C9B3A0]);
  CFDictionaryAddValue(v9, CFSTR("propertyName"), CFSTR("visualRepresentation"));
  CFDictionaryAddValue(v9, CFSTR("propertyRuntimeType"), CFSTR("CGImage"));
  CFDictionaryAddValue(v9, CFSTR("propertyLogicalType"), CFSTR("DebugHierarchyLogicalPropertyTypeImage"));
  CFDictionaryAddValue(v9, CFSTR("propertyFormat"), CFSTR("public.data"));
  v14 = 8;
  v10 = CFNumberCreate(0, kCFNumberCFIndexType, &v14);
  CFDictionaryAddValue(v9, CFSTR("visibility"), v10);
  CFRelease(v10);
  v14 = 1;
  v11 = CFNumberCreate(0, kCFNumberCFIndexType, &v14);
  CFDictionaryAddValue(v9, CFSTR("propertyOptions"), v11);
  CFRelease(v11);
  v15[5] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 6);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

+ (id)debugHierarchyValueForPropertyWithName:(id)a3 onObject:(id)a4 outOptions:(id *)a5 outError:(id *)Mutable
{
  id v9;
  void *v10;
  CGImage *v11;
  uint64_t v12;
  CGImageDestination *v13;
  const __CFAllocator *v14;
  CFNumberRef v15;
  const __CFDictionary *v16;
  id v17;
  CGColor *v18;
  size_t NumberOfComponents;
  uint64_t v20;
  CFIndex v21;
  __CFString *v22;
  CFIndex v23;
  uint64_t v24;
  id v25;
  NSString *v26;
  NSString *v27;
  const CGFloat *Components;
  const void **v29;
  const void **v30;
  uint64_t v31;
  CFNumberRef *v32;
  CFArrayRef v33;
  uint64_t v34;
  CFTypeRef *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  NSString *v40;
  id v41;
  __CFString *v42;
  __CFString *v43;
  __CFString *v44;
  __CFString *v45;
  void *v46;
  void *v47;
  id v48;
  id v50;
  CGColorSpace *space;
  CFStringRef value;
  id v53;
  int valuePtr;
  const __CFString *v55;
  uint64_t v56;
  const __CFString *v57;
  uint64_t v58;
  void *values[3];
  void *keys[4];

  keys[3] = *(void **)MEMORY[0x1E0C80C00];
  v9 = a3;
  v53 = a4;
  if (objc_msgSend(v9, "isEqualToString:", CFSTR("particleTexture")))
  {
    objc_msgSend(v53, "particleTexture");
    Mutable = (id *)objc_claimAutoreleasedReturnValue();

    if (Mutable)
    {
      objc_msgSend(v53, "particleTexture");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = (CGImage *)objc_msgSend(v10, "CGImage");

      if (v11)
      {
        valuePtr = 1065353216;
        Mutable = (id *)CFDataCreateMutable(0, 0);
        v12 = *MEMORY[0x1E0CA5C10];
        v13 = CGImageDestinationCreateWithData((CFMutableDataRef)Mutable, (CFStringRef)*MEMORY[0x1E0CA5C10], 1uLL, 0);
        v14 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
        v15 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], kCFNumberFloatType, &valuePtr);
        keys[0] = *(void **)MEMORY[0x1E0CBC780];
        values[0] = v15;
        v16 = CFDictionaryCreate(v14, (const void **)keys, (const void **)values, 1, 0, 0);
        CGImageDestinationAddImage(v13, v11, v16);
        CGImageDestinationFinalize(v13);
        CFRelease(v16);
        CFRelease(v15);
        CFRelease(v13);
        v57 = CFSTR("propertyFormat");
        v58 = v12;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v58, &v57, 1);
        *a5 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        Mutable = 0;
      }
      CGImageRelease(v11);
    }
    goto LABEL_67;
  }
  if (!objc_msgSend(v9, "isEqualToString:", CFSTR("particleColor")))
  {
    if (objc_msgSend(v9, "isEqualToString:", CFSTR("visualRepresentation")))
    {
      objc_msgSend(v53, "createDebugHierarchyVisualRepresentation");
      Mutable = (id *)objc_claimAutoreleasedReturnValue();
      v55 = CFSTR("propertyFormat");
      v56 = *MEMORY[0x1E0CA5C10];
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v56, &v55, 1);
      *a5 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_67;
    }
    v25 = v53;
    v26 = (NSString *)v9;
    if (-[NSString length](v26, "length"))
    {
      NSSelectorFromString(v26);
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        v27 = v26;
        if (v27)
        {
LABEL_20:
          objc_msgSend(v25, "valueForKey:", v27);
          Mutable = (id *)objc_claimAutoreleasedReturnValue();
LABEL_66:

          goto LABEL_67;
        }
      }
      else
      {
        if (-[NSString length](v26, "length") < 2)
        {
          -[NSString uppercaseString](v26, "uppercaseString");
          v39 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          -[NSString substringToIndex:](v26, "substringToIndex:", 1);
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v36, "uppercaseString");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSString substringFromIndex:](v26, "substringFromIndex:", 1);
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v37, "stringByAppendingString:", v38);
          v39 = (void *)objc_claimAutoreleasedReturnValue();

        }
        objc_msgSend(CFSTR("is"), "stringByAppendingString:", v39);
        v40 = (NSString *)objc_claimAutoreleasedReturnValue();
        NSSelectorFromString(v40);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          v27 = v40;
        else
          v27 = 0;

        if (v27)
          goto LABEL_20;
      }
    }
    if (Mutable)
    {
      v41 = v25;
      v42 = v26;
      if (v41)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@"), v41);
        v43 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v43 = &stru_1EA5021F8;
      }
      if (v42)
        v44 = v42;
      else
        v44 = &stru_1EA5021F8;
      v45 = v44;
      values[0] = CFSTR("propertyName");
      values[1] = CFSTR("objectDescription");
      keys[0] = v45;
      keys[1] = v43;
      values[2] = CFSTR("errorDescription");
      keys[2] = &stru_1EA5021F8;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", keys, values, 3);
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("DebugHierarchyErrorDomain"), 100, v46);
      v47 = (void *)objc_claimAutoreleasedReturnValue();

      v48 = objc_retainAutorelease(v47);
      *Mutable = v48;

      v27 = 0;
      Mutable = 0;
    }
    else
    {
      v27 = 0;
    }
    goto LABEL_66;
  }
  objc_msgSend(v53, "particleColor");
  v17 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v18 = (CGColor *)objc_msgSend(v17, "CGColor");
  if (v18)
  {
    Mutable = (id *)CFDictionaryCreateMutable(0, 20, MEMORY[0x1E0C9AEB8], MEMORY[0x1E0C9B3A0]);
    space = CGColorGetColorSpace(v18);
    value = CGColorSpaceCopyName(space);
    NumberOfComponents = CGColorGetNumberOfComponents(v18);
    v20 = NumberOfComponents << 32;
    v21 = (int)NumberOfComponents;
    if (NumberOfComponents << 32)
    {
      v22 = CFStringCreateMutable(0, 0);
      v50 = v17;
      v23 = v21 - 1;
      if ((unint64_t)v21 <= 1)
        v24 = 1;
      else
        v24 = v21;
      do
      {
        CFStringAppend(v22, CFSTR("CGf"));
        if (v23)
          CFStringAppend(v22, CFSTR(", "));
        --v23;
        --v24;
      }
      while (v24);
      v17 = v50;
    }
    else
    {
      v22 = &stru_1EA5021F8;
    }
    Components = CGColorGetComponents(v18);
    v29 = (const void **)malloc_type_malloc(v20 >> 29, 0x6004044C4A2DFuLL);
    v30 = v29;
    if (v20 >= 1)
    {
      if (v21 <= 1)
        v31 = 1;
      else
        v31 = v21;
      v32 = (CFNumberRef *)v29;
      do
      {
        *v32++ = CFNumberCreate(0, kCFNumberCGFloatType, Components++);
        --v31;
      }
      while (v31);
    }
    v33 = CFArrayCreate(0, v30, v21, MEMORY[0x1E0C9B378]);
    if (v20 >= 1)
    {
      if (v21 <= 1)
        v34 = 1;
      else
        v34 = v21;
      v35 = v30;
      do
      {
        CFRelease(*v35++);
        --v34;
      }
      while (v34);
    }
    free(v30);
    CGColorSpaceGetModel(space);
    if (v33)
      CFDictionaryAddValue((CFMutableDictionaryRef)Mutable, CFSTR("componentValues"), v33);
    if (v22)
      CFDictionaryAddValue((CFMutableDictionaryRef)Mutable, CFSTR("componentValuesFormat"), v22);
    if (value)
      CFDictionaryAddValue((CFMutableDictionaryRef)Mutable, CFSTR("colorSpaceName"), value);
    if (v33)
      CFRelease(v33);
    if (value)
      CFRelease(value);
    if (v22)
      CFRelease(v22);
  }
  else
  {
    Mutable = 0;
  }

LABEL_67:
  return Mutable;
}

- (SKParticleRenderOrder)particleRenderOrder
{
  return self->_particleRenderOrder;
}

- (void)setParticleRenderOrder:(SKParticleRenderOrder)particleRenderOrder
{
  self->_particleRenderOrder = particleRenderOrder;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_particleSpeedSequence, 0);
  objc_storeStrong((id *)&self->_fieldInfluenceSequence, 0);
  objc_storeStrong((id *)&self->_rotationSequence, 0);
  objc_storeStrong((id *)&self->_scaleSequence, 0);
  objc_storeStrong((id *)&self->_alphaSequence, 0);
  objc_storeStrong((id *)&self->_colorBlendSequence, 0);
  objc_storeStrong((id *)&self->_colorSequence, 0);
  objc_destroyWeak((id *)&self->_target);
  objc_storeStrong((id *)&self->_particleTexture, 0);
}

@end
