@implementation XRWaitingRoom

+ (void)initialize
{
  uint64_t v2;
  void *v3;

  if ((id)objc_opt_class() == a1)
  {
    v2 = objc_opt_new();
    v3 = (void *)qword_25583C640;
    qword_25583C640 = v2;

  }
}

- (XRWaitingRoom)initWithDispatchQueue:(id)a3 funnelTarget:(id)a4
{
  XRWaitingRoom *v4;
  uint64_t v5;
  NSMutableArray *unaffiliatedVisitorsWaiting;
  uint64_t v7;
  NSMutableSet *teamMembersWaiting;
  uint64_t v9;
  NSMutableSet *activeTeams;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)XRWaitingRoom;
  v4 = -[XRMobileAgentQueueStop initWithDispatchQueue:funnelTarget:](&v12, sel_initWithDispatchQueue_funnelTarget_, a3, a4);
  if (v4)
  {
    v5 = objc_opt_new();
    unaffiliatedVisitorsWaiting = v4->_unaffiliatedVisitorsWaiting;
    v4->_unaffiliatedVisitorsWaiting = (NSMutableArray *)v5;

    v7 = objc_opt_new();
    teamMembersWaiting = v4->_teamMembersWaiting;
    v4->_teamMembersWaiting = (NSMutableSet *)v7;

    v9 = objc_opt_new();
    activeTeams = v4->_activeTeams;
    v4->_activeTeams = (NSMutableSet *)v9;

  }
  return v4;
}

- (XRWaitingRoom)initWithOwner:(id)a3 dispatchQueue:(id)a4
{
  uint64_t v4;
  XRWaitingRoom *result;

  result = (XRWaitingRoom *)objc_msgSend_initWithDispatchQueue_(self, a2, (uint64_t)a4, (uint64_t)a4, v4);
  if (result)
    result->_ownerID = a3;
  return result;
}

- (int)agentStopDiagnosticsTypeCode
{
  return 9;
}

- (BOOL)_holdReceivedAgent:(id)a3 ticket:(id)a4
{
  id v6;
  void *v7;
  id v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t *p_visitingOwner;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  NSMutableSet *v47;
  const char *v48;
  uint64_t v49;
  const char *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  void *v57;
  void *v58;
  const char *v59;
  uint64_t v60;
  uint64_t v61;
  int v62;
  XRMobileAgentOwner *visitingOwner;
  const char *v64;
  uint64_t v65;
  uint64_t v66;
  const char *v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  void *v71;
  const char *v72;
  uint64_t v73;
  uint64_t v74;
  int isSubsetOfSet;
  const char *v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  void *v80;
  NSMutableSet *teamMembersWaiting;
  void *v82;
  const char *v83;
  uint64_t v84;
  uint64_t v85;
  const char *v86;
  uint64_t v87;
  uint64_t v88;
  const char *v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  void *v93;
  const char *v94;
  uint64_t v95;
  const char *v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t i;
  XRMobileAgentOwner *v102;
  const char *v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  void *v107;
  const char *v108;
  uint64_t v109;
  XRMobileAgentOwner *v110;
  const char *v111;
  uint64_t v112;
  uint64_t v113;
  const char *v114;
  uint64_t v115;
  uint64_t v116;
  NSMutableSet *v117;
  void *v118;
  const char *v119;
  uint64_t v120;
  uint64_t v121;
  const char *v122;
  uint64_t v123;
  uint64_t v124;
  const char *v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t v128;
  void *v129;
  const char *v130;
  uint64_t v131;
  const char *v132;
  uint64_t v133;
  uint64_t v134;
  uint64_t v135;
  uint64_t v136;
  uint64_t j;
  uint64_t v138;
  const char *v139;
  uint64_t v140;
  uint64_t v141;
  uint64_t v142;
  void *v143;
  const char *v144;
  uint64_t v145;
  void *v146;
  NSMutableSet *v147;
  void *v148;
  uint64_t v149;
  const char *v150;
  uint64_t v151;
  uint64_t v152;
  const char *v153;
  uint64_t v154;
  uint64_t v155;
  const char *v156;
  uint64_t v157;
  uint64_t v158;
  const char *v159;
  uint64_t v160;
  uint64_t v161;
  const char *v162;
  uint64_t v163;
  uint64_t v164;
  XRMobileAgentOwner *v165;
  void *v166;
  __int128 v167;
  __int128 v168;
  __int128 v169;
  __int128 v170;
  __int128 v171;
  __int128 v172;
  __int128 v173;
  __int128 v174;
  __int128 v175;
  __int128 v176;
  __int128 v177;
  __int128 v178;
  _BYTE v179[128];
  _BYTE v180[128];
  _BYTE v181[128];
  uint64_t v182;

  v182 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = v6;
  if (self->_ownerID != v6)
  {
    v8 = v6;
    objc_msgSend_ticket(v8, v9, v10, v11, v12);
    v13 = objc_claimAutoreleasedReturnValue();
    v17 = (void *)v13;
    if (self->_abandoned)
    {
      objc_msgSend__welcomeAgent_(self, v14, (uint64_t)v8, v15, v16);
    }
    else
    {
      visitingOwner = self->_visitingOwner;
      if (visitingOwner)
      {
        if (v13)
        {
          objc_msgSend_addObject_(self->_teamMembersWaiting, v14, (uint64_t)v8, v15, v16);
          objc_msgSend_addObject_(self->_activeTeams, v64, (uint64_t)v17, v65, v66);
          objc_msgSend_members(v17, v67, v68, v69, v70);
          v71 = (void *)objc_claimAutoreleasedReturnValue();
          isSubsetOfSet = objc_msgSend_isSubsetOfSet_(v71, v72, (uint64_t)self->_teamMembersWaiting, v73, v74);

          if (isSubsetOfSet)
          {
            v80 = v7;
            teamMembersWaiting = self->_teamMembersWaiting;
            objc_msgSend_members(v17, v76, v77, v78, v79);
            v82 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_minusSet_(teamMembersWaiting, v83, (uint64_t)v82, v84, v85);

            objc_msgSend_setGreetingTeam_(self->_visitingOwner, v86, (uint64_t)v17, v87, v88);
            v169 = 0u;
            v170 = 0u;
            v167 = 0u;
            v168 = 0u;
            objc_msgSend_members(v17, v89, v90, v91, v92);
            v93 = (void *)objc_claimAutoreleasedReturnValue();
            v95 = objc_msgSend_countByEnumeratingWithState_objects_count_(v93, v94, (uint64_t)&v167, (uint64_t)v179, 16);
            if (v95)
            {
              v99 = v95;
              v100 = *(_QWORD *)v168;
              do
              {
                for (i = 0; i != v99; ++i)
                {
                  if (*(_QWORD *)v168 != v100)
                    objc_enumerationMutation(v93);
                  objc_msgSend_setRoomOwner_(*(void **)(*((_QWORD *)&v167 + 1) + 8 * i), v96, (uint64_t)self->_visitingOwner, v97, v98);
                }
                v99 = objc_msgSend_countByEnumeratingWithState_objects_count_(v93, v96, (uint64_t)&v167, (uint64_t)v179, 16);
              }
              while (v99);
            }

            v102 = self->_visitingOwner;
            objc_msgSend_members(v17, v103, v104, v105, v106);
            v107 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend__welcomeAgent_followedByAgents_(self, v108, (uint64_t)v102, (uint64_t)v107, v109);

            v110 = self->_visitingOwner;
            self->_visitingOwner = 0;

            objc_msgSend_removeObject_(self->_activeTeams, v111, (uint64_t)v17, v112, v113);
            v7 = v80;
          }
        }
        else
        {
          objc_msgSend_setRoomOwner_(v8, v14, (uint64_t)visitingOwner, v15, v16);
          objc_msgSend_setGreetingVisitor_(self->_visitingOwner, v159, (uint64_t)v8, v160, v161);
          objc_msgSend__welcomeAgents_(self, v162, (uint64_t)self->_visitingOwner, v163, v164, v8, 0);
          v165 = self->_visitingOwner;
          self->_visitingOwner = 0;

        }
      }
      else if (v13)
      {
        objc_msgSend_addObject_(self->_teamMembersWaiting, v14, (uint64_t)v8, v15, v16);
        objc_msgSend_addObject_(self->_activeTeams, v114, (uint64_t)v17, v115, v116);
      }
      else
      {
        objc_msgSend_addObject_(self->_unaffiliatedVisitorsWaiting, v14, (uint64_t)v8, v15, v16);
      }
    }

    goto LABEL_5;
  }
  p_visitingOwner = (uint64_t *)&self->_visitingOwner;
  objc_storeStrong((id *)&self->_visitingOwner, a3);
  if (self->_abandoned)
  {
    objc_msgSend__welcomeAgent_(self, v20, *p_visitingOwner, v22, v23);
    v24 = (void *)*p_visitingOwner;
    *p_visitingOwner = 0;

  }
  if (*p_visitingOwner)
  {
    if (objc_msgSend_count(self->_unaffiliatedVisitorsWaiting, v20, v21, v22, v23))
    {
      objc_msgSend_firstObject(self->_unaffiliatedVisitorsWaiting, v25, v26, v27, v28);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_removeObjectAtIndex_(self->_unaffiliatedVisitorsWaiting, v30, 0, v31, v32);
      objc_msgSend_setRoomOwner_(v29, v33, *p_visitingOwner, v34, v35);
      objc_msgSend_setGreetingVisitor_((void *)*p_visitingOwner, v36, (uint64_t)v29, v37, v38);
      objc_msgSend__welcomeAgents_(self, v39, *p_visitingOwner, v40, v41, v29, 0);
      v42 = (void *)*p_visitingOwner;
      *p_visitingOwner = 0;

    }
    if (*p_visitingOwner)
    {
      if (objc_msgSend_count(self->_teamMembersWaiting, v25, v26, v27, v28))
      {
        v177 = 0u;
        v178 = 0u;
        v175 = 0u;
        v176 = 0u;
        v47 = self->_activeTeams;
        v49 = objc_msgSend_countByEnumeratingWithState_objects_count_(v47, v48, (uint64_t)&v175, (uint64_t)v181, 16);
        if (v49)
        {
          v54 = v49;
          v166 = v7;
          v55 = *(_QWORD *)v176;
LABEL_16:
          v56 = 0;
          while (1)
          {
            if (*(_QWORD *)v176 != v55)
              objc_enumerationMutation(v47);
            v57 = *(void **)(*((_QWORD *)&v175 + 1) + 8 * v56);
            objc_msgSend_members(v57, v50, v51, v52, v53);
            v58 = (void *)objc_claimAutoreleasedReturnValue();
            v62 = objc_msgSend_isSubsetOfSet_(v58, v59, (uint64_t)self->_teamMembersWaiting, v60, v61);

            if (v62)
              break;
            if (v54 == ++v56)
            {
              v54 = objc_msgSend_countByEnumeratingWithState_objects_count_(v47, v50, (uint64_t)&v175, (uint64_t)v181, 16);
              if (v54)
                goto LABEL_16;
              v7 = v166;
              goto LABEL_45;
            }
          }
          v117 = self->_teamMembersWaiting;
          objc_msgSend_members(v57, v50, v51, v52, v53);
          v118 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_minusSet_(v117, v119, (uint64_t)v118, v120, v121);

          objc_msgSend_setGreetingTeam_((void *)*p_visitingOwner, v122, (uint64_t)v57, v123, v124);
          v173 = 0u;
          v174 = 0u;
          v171 = 0u;
          v172 = 0u;
          objc_msgSend_members(v57, v125, v126, v127, v128);
          v129 = (void *)objc_claimAutoreleasedReturnValue();
          v131 = objc_msgSend_countByEnumeratingWithState_objects_count_(v129, v130, (uint64_t)&v171, (uint64_t)v180, 16);
          v7 = v166;
          if (v131)
          {
            v135 = v131;
            v136 = *(_QWORD *)v172;
            do
            {
              for (j = 0; j != v135; ++j)
              {
                if (*(_QWORD *)v172 != v136)
                  objc_enumerationMutation(v129);
                objc_msgSend_setRoomOwner_(*(void **)(*((_QWORD *)&v171 + 1) + 8 * j), v132, *p_visitingOwner, v133, v134);
              }
              v135 = objc_msgSend_countByEnumeratingWithState_objects_count_(v129, v132, (uint64_t)&v171, (uint64_t)v180, 16);
            }
            while (v135);
          }

          v138 = *p_visitingOwner;
          objc_msgSend_members(v57, v139, v140, v141, v142);
          v143 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend__welcomeAgent_followedByAgents_(self, v144, v138, (uint64_t)v143, v145);

          v146 = (void *)*p_visitingOwner;
          *p_visitingOwner = 0;

          v147 = v57;
          if (v147)
          {
            objc_msgSend_removeObject_(self->_activeTeams, v43, (uint64_t)v147, v45, v46);
            v47 = v147;
            goto LABEL_45;
          }
        }
        else
        {
LABEL_45:

        }
      }
      if (*p_visitingOwner)
      {
        objc_msgSend_ticket((void *)*p_visitingOwner, v43, v44, v45, v46);
        v148 = (void *)objc_claimAutoreleasedReturnValue();
        v149 = qword_25583C640;

        if (v148 == (void *)v149)
        {
          objc_msgSend_setGreetingTeam_((void *)*p_visitingOwner, v150, 0, v151, v152);
          objc_msgSend_setGreetingVisitor_((void *)*p_visitingOwner, v153, 0, v154, v155);
          objc_msgSend__welcomeAgent_(self, v156, *p_visitingOwner, v157, v158);
          v8 = (id)*p_visitingOwner;
          *p_visitingOwner = 0;
LABEL_5:

        }
      }
    }
  }

  return 1;
}

- (void)_escortAgentToExit:(id)a3 withTicket:(id)a4
{
  id v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  id v12;

  v5 = a3;
  v12 = v5;
  if (self->_ownerID == v5)
  {
    objc_msgSend_setGreetingVisitor_(v5, v6, 0, v7, v8);
    objc_msgSend_setGreetingTeam_(v12, v9, 0, v10, v11);
  }
  else
  {
    objc_msgSend_setRoomOwner_(v5, v6, 0, v7, v8);
  }

}

- (void)setupMeetingWithOwner:(id)a3 worker:(id)a4 mode:(id)a5
{
  id v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  id v19;

  v19 = a3;
  v9 = a5;
  if ((objc_msgSend_holdsItinerary_(a4, v10, (uint64_t)v19, v11, v12) & 1) == 0)
  {
    objc_msgSend_currentHandler(MEMORY[0x24BDD1448], v13, v14, v15, v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v17, v18, (uint64_t)a2, (uint64_t)self, (uint64_t)CFSTR("XRWaitingRoom.m"), 198, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[worker holdsItinerary:workersItinerary]"));

  }
  objc_msgSend_setNextStop_mode_ticket_(v19, v13, (uint64_t)self, (uint64_t)v9, 0);

}

- (void)setupMeetingWithOwner:(id)a3 worker:(id)a4 team:(id)a5 mode:(id)a6
{
  id v11;
  id v12;
  id v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  char v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  const char *v31;
  void *v32;
  const char *v33;
  void *v34;
  const char *v35;
  id v36;

  v36 = a4;
  v11 = a5;
  v12 = a6;
  v13 = a3;
  if ((objc_msgSend_holdsItinerary_(v36, v14, (uint64_t)v13, v15, v16) & 1) == 0)
  {
    objc_msgSend_currentHandler(MEMORY[0x24BDD1448], v17, v18, v19, v20);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v32, v33, (uint64_t)a2, (uint64_t)self, (uint64_t)CFSTR("XRWaitingRoom.m"), 203, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[worker holdsItinerary:workersItinerary]"));

  }
  objc_msgSend_members(v11, v17, v18, v19, v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = objc_msgSend_containsObject_(v21, v22, (uint64_t)v36, v23, v24);

  if ((v25 & 1) == 0)
  {
    objc_msgSend_currentHandler(MEMORY[0x24BDD1448], v26, v27, v28, v29);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v34, v35, (uint64_t)a2, (uint64_t)self, (uint64_t)CFSTR("XRWaitingRoom.m"), 204, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[team.members containsObject:worker]"));

  }
  objc_msgSend_visitorTicketForAgent_team_(self, v26, (uint64_t)v36, (uint64_t)v11, v29);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setNextStop_mode_ticket_(v13, v31, (uint64_t)self, (uint64_t)v12, (uint64_t)v30);

}

- (id)visitorTicketForAgent:(id)a3 team:(id)a4
{
  return a4;
}

- (id)ownerTicketForAgent:(id)a3 leaveWhenEmpty:(BOOL)a4
{
  uint64_t v4;
  _BOOL4 v5;
  void *v6;
  void *v10;
  const char *v11;

  v5 = a4;
  if (self->_ownerID != a3)
  {
    objc_msgSend_currentHandler(MEMORY[0x24BDD1448], a2, (uint64_t)a3, a4, v4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v10, v11, (uint64_t)a2, (uint64_t)self, (uint64_t)CFSTR("XRWaitingRoom.m"), 215, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("agent == _ownerID"));

  }
  if (v5)
    v6 = (void *)qword_25583C640;
  else
    v6 = 0;
  return v6;
}

- (void)setupOwnerVisit:(id)a3 leaveWhenEmpty:(BOOL)a4 mode:(id)a5
{
  if (a4)
    objc_msgSend_setNextStop_mode_ticket_(a3, a2, (uint64_t)self, (uint64_t)a5, qword_25583C640);
  else
    objc_msgSend_setNextStop_mode_ticket_(a3, a2, (uint64_t)self, (uint64_t)a5, 0);
}

- (void)setupOwnerVisit:(id)a3 mode:(id)a4
{
  MEMORY[0x24BEDD108](self, sel_setupOwnerVisit_leaveWhenEmpty_mode_, a3, 0, a4);
}

- (void)abandon
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  NSObject *v6;
  _QWORD block[5];

  objc_msgSend__funnelQueue(self, a2, v2, v3, v4);
  v6 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = sub_22634E030;
  block[3] = &unk_24EDC2C58;
  block[4] = self;
  dispatch_async(v6, block);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activeTeams, 0);
  objc_storeStrong((id *)&self->_teamMembersWaiting, 0);
  objc_storeStrong((id *)&self->_unaffiliatedVisitorsWaiting, 0);
  objc_storeStrong((id *)&self->_visitingOwner, 0);
}

@end
